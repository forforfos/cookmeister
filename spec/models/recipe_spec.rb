require 'rails_helper'

RSpec.describe 'Recipe', type: :model do
  before(:all) do
    @recipe = build :recipe
  end

  subject { @recipe }

  describe 'attribute_accessors' do
    it { is_expected.to respond_to(:title, :title=) }
    it { is_expected.to respond_to(:cook_time, :cook_time=) }
    it { is_expected.to respond_to(:prep_time, :prep_time=) }
    it { is_expected.to respond_to(:ratings, :ratings=) }
    it { is_expected.to respond_to(:image, :image=) }
    it { is_expected.to respond_to(:category, :category=) }
    it { is_expected.to respond_to(:author, :author=) }
    it { is_expected.to respond_to(:ingredients, :ingredients=) }
  end

  describe 'validations' do
    describe 'title' do
      context 'when it is empty' do
        before { @recipe.title = '' }

        it { is_expected.to be_invalid }
      end

      context 'when it is not empty' do
        before { @recipe.title = 'Valid recipe title' }

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'ingredients_length' do
    subject { @recipe.ingredients_length }
    it { is_expected.to eq(2) }
  end

  describe 'elasticsearch' do
    it 'should initially have no User records' do
      expect(Recipe.search(['flour']).records.length).to eq(0)
    end

    it 'should update index' do
      recipe = build :recipe
      recipe.ingredients = [Ingredient.create!(name: 'flour')]
      recipe.save!

      Recipe.__elasticsearch__.refresh_index!
      expect(Recipe.search(["flour"]).records.length).to eq(1)
    end
  end
end
