recipes = JSON.parse(File.read("#{Rails.root}/db/recipes-en.json"))

authors = []
recipes.each do |recipe|
  authors << recipe['author']
end

authors.uniq!

authors = authors.map do |author|
  Author.new(name: author)
end

authors << Author.new(name: 'unknown')

Author.import authors

p 'Authors saved'
p '*'*20
