FactoryBot.define do
  factory :recipe, class: 'Recipe' do
    title { Faker::Food.dish }
    cook_time { 25 }
    prep_time { 70 }
    ratings { 3.8 }
    image { 'url_to_image' }
    association :category
    association :author
    ingredients {
      [
        Ingredient.create!(name: Faker::Food.ingredient),
        Ingredient.create!(name: Faker::Food.ingredient)
      ]
    }
  end
end
