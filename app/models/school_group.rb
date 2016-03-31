class SchoolGroup < ActiveRecord::Base
  has_many :schools
  resourcify
  include Elasticsearch::Model
  include Elasticsearch::Model::Response::Pagination::WillPaginate

  def as_indexed_json(options={})
    self.as_json(
        only: [:id, :name]
    )
  end

  def self.import
    SchoolGroup.all.find_in_batches do |school_groups|
      SchoolGroup.__elasticsearch__.client.bulk({
        index: ::SchoolGroup.__elasticsearch__.index_name,
        type: ::SchoolGroup.__elasticsearch__.document_type,
        body: school_groups.map do |school_group|
         {
           index: {
             _id: school_group.id,
             data: school_group.as_indexed_json
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
        index: SchoolGroup.index_name,
        type: SchoolGroup.document_type,
        id: id
    )
    rescue Faraday::ConnectionFailed
  end

  def self.search(params, *args)
    query = "name: *#{params}*"
    es = SchoolGroup.__elasticsearch__.search(
        query: {query_string: {query: query}},
        size: 20
    )
    es.records.to_a
    rescue Faraday::ConnectionFailed
      search_in_db(params);
  end

  def self.search_in_db(params)
    SchoolGroup.where('name LIKE ?', "%#{params}%").all
  end

  SchoolGroup.__elasticsearch__.create_index! force: true
  SchoolGroup.import
  rescue Faraday::ConnectionFailed


end
