class Category < ApplicationRecord
  has_many :recipes

  validates :title, presence: true, uniqueness: true
end
