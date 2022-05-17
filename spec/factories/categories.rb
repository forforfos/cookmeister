FactoryBot.define do
  factory :category, class: "Category" do
    title { Faker::Food.ethnic_category }
  end
end
