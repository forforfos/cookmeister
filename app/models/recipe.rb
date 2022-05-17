require 'cookmeister/elasticsearch/index'

class Recipe < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :author
  belongs_to :category
  has_and_belongs_to_many :ingredients

  def ingredients_length
    ingredients.length
  end

  def as_indexed_json(_options = nil)
    as_json(
      methods: [:ingredients_length],
      only: [:id, :title, :cook_time, :ingredients_length],
      include: {
        ingredients: {
          only: [:id, :name]
        },
        category: {
          only: [:id, :title]
        },
        author: {
          only: [:id, :name]
        }
      }
    )
  end

  mapping dynamic: :strict do
    indexes :id, type: 'integer'
    indexes :title, type: 'text'
    indexes :cook_time, type: 'integer'
    indexes :ingredients_length, type: 'integer'
    indexes :ingredients do
      indexes :id, type: 'integer'
      indexes :name, type: 'text'
    end
    indexes :category do
      indexes :id, type: 'integer'
      indexes :title, type: 'text'
    end
    indexes :author do
      indexes :id, type: 'integer'
      indexes :name, type: 'text'
    end
  end

  def self.elasticsearch_create_index(force = false)
    Cookmeister::ElasticSearch::Index.create_index force
    __elasticsearch__.import
  end

  def self.search(ingredients)
    options = {
      size: 24,
      query: {
        bool: {
          must: match_clauses(ingredients)
        }
      },
      sort: [{ ingredients_length: 'ASC' }]
    }

    response = __elasticsearch__.search options

    Rails.logger.info "Elasticsearch query took: #{response.took}ms"

    response.records
  end

  private

  def self.match_clauses ingredients
    ingredients.map do |ingredient|
      {
        match: {
          "ingredients.name": {
            query: ingredient,
            fuzziness: 'AUTO:5,8'
          }
        }
      }
    end
  end
end
