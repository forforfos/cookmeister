class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :preping_time, :cooking_time, :image, :author, :category
  has_many :ingredients

  def author
    object.author.name
  end

  def category
    object.category.title
  end

  def cooking_time
    DurationFormatter.format_by_minutes object.cook_time
  end

  def preping_time
    DurationFormatter.format_by_minutes object.prep_time
  end
end
