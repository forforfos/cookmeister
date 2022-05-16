class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :preping_time, :cooking_time, :image, :ratings
  has_many :ingredients
  belongs_to :author
  belongs_to :category

  def cooking_time
    DurationFormatter.format_by_minutes object.cook_time
  end

  def preping_time
    DurationFormatter.format_by_minutes object.prep_time
  end
end
