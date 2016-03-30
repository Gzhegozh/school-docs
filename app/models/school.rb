class School < ActiveRecord::Base
  belongs_to :school_group
  has_many :grades

  include Elasticsearch::Model
  include Elasticsearch::Model::Response::Pagination::WillPaginate

  def as_indexed_json(options={})
    self.as_json(
        only: [:id, :name, :school_group_id]
    )
  end

  def self.import
    School.all.find_in_batches do |schools|
      School.__elasticsearch__.client.bulk({
        index: ::School.__elasticsearch__.index_name,
        type: ::School.__elasticsearch__.document_type,
        body: schools.map do |schools|
          {
            index: {
              _id: schools.id,
              data: schools.as_indexed_json
            }
          }
        end
      })
    end
  end

  after_commit '__elasticsearch__.index_document', on: :create
  after_commit '__elasticsearch__.update_document', on: :update
  after_commit :update_index_on_destroy, on: :destroy

  def update_index_on_destroy
    __elasticsearch__.client.delete(
        index: School.index_name,
        type: School.document_type,
        id: id
    )
  end

  def self.search(params, *args)
    query = "name: *#{params[:query]}* AND school_group_id: *#{params[:school_group_id]}*"
    es = School.__elasticsearch__.search(
        query: {query_string: {query: query}},
        size: 20
    )
    es.records.to_a
  rescue Faraday::ConnectionFailed
    search_in_db(params);
  end

  def self.search_in_db(params)
    School.where('name LIKE ? AND school_group_id = ?', "%#{params[:query]}%", params[:school_group_id]).all
  end

  School.__elasticsearch__.create_index! force: true
  School.import
  rescue Faraday::ConnectionFailed


end
