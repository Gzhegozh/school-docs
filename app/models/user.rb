class User < ActiveRecord::Base
  before_create :build_profile
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile

  has_many :grades, through: :enrollments
  has_many :enrollments

  acts_as_messageable

  def name
    email
  end

  def mailboxer_email(object)
    email
  end

  def parent?
    has_role? 'parent'
  end

  def student?
    has_role? 'student'
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Response::Pagination::WillPaginate

  def as_indexed_json(options={})
    self.as_json(
        only: [:id, :email]
    )
  end

  def self.import
    User.all.find_in_batches do |users|
      User.__elasticsearch__.client.bulk({
          index: ::User.__elasticsearch__.index_name,
          type: ::User.__elasticsearch__.document_type,
          body: users.map do |user|
            {
                index: {
                    _id: user.id,
                    data: user.as_indexed_json
                }
            }
          end
      })
    end
    rescue Faraday::ConnectionFailed
  end

  after_commit '__elasticsearch__.index_document', on: :create
  after_commit '__elasticsearch__.update_document', on: :update
  after_commit :update_index_on_destroy, on: :destroy
  rescue Faraday::ConnectionFailed

  def update_index_on_destroy
    __elasticsearch__.client.delete(
        index: User.index_name,
        type: User.document_type,
        id: id
    )
    rescue Faraday::ConnectionFailed
  end

  def self.search(params, *args)
    query = "email: *#{params}*"
    es = User.__elasticsearch__.search(
        query: {query_string: {query: query}},
        size: 20
    )
    es.records.to_a
  rescue Faraday::ConnectionFailed
    search_in_db(params);
  end

  def self.search_in_db(params)
    User.where('email LIKE ?', "%#{params}%").all
  end

  User.__elasticsearch__.create_index! force: true
  User.import
  rescue Faraday::ConnectionFailed

end
