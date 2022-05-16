recipes = JSON.parse(File.read("#{Rails.root}/db/recipes-en.json"))

categories = []
recipes.each do |recipe|
  categories << recipe['category']
end

categories.uniq!

categories = categories.map do |category|
  Category.new(title: category)
end

categories << Category.new(title: 'misc')

Category.import categories

p '*'*20
p 'Categories saved'
p '*'*20
