module Cookmeister
  module ElasticSearch
    class Index
      NAME = 'recipes'.freeze

      class << self
        def create_index(force = false, test = false)
          index_already_exists = ::Elasticsearch::Model.client.indices.exists?(index: Index::NAME) rescue false

          if force && index_already_exists
            p "Deleting already existing index '#{Index::NAME}'"
            ::Elasticsearch::Model.client.indices.delete(index: Index::NAME)
          elsif index_already_exists
            p "Index #{Index::NAME} already exists. Skipping creation."
            return
          end

          p "Creating index #{Index::NAME}"
          ::Elasticsearch::Model.client.indices.create index: Index::NAME
        end
      end
    end
  end
end