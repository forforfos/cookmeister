require 'json'

starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

load Rails.root.join('db', 'seed_categories.rb')
load Rails.root.join('db', 'seed_authors.rb')
load Rails.root.join('db', 'seed_ingredients.rb')
load Rails.root.join('db', 'seed_recipes.rb')
load Rails.root.join('db', 'seed_ingredients_recipe.rb')

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
elapsed = ending - starting

p "It took #{elapsed} seconds to seed the DB"
