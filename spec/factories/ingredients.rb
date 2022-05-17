FactoryBot.define do
  factory :ingredient, class: 'Ingredient' do
    name { Faker::Food.ingredient }
  end
end

def ingredients_with_recipes(recipes_length = 5)
  FactoryBot.create(:ingredient) do |ingredient|
    FactoryBot.create_list(:recipe, recipes_length, ingredients: [ingredient])
  end
end
