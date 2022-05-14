class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :recipes, serializer: TitlesSerializer
end
