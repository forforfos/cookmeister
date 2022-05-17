RSpec.describe 'Ingredient', type: :model do
  subject { ingredients_with_recipes(5) }

  describe 'attribute_accessors' do
    it { is_expected.to respond_to(:name, :name=) }
    it { is_expected.to respond_to(:recipes, :recipes=) }
  end

  describe 'recipes' do
    subject { ingredients_with_recipes(4).recipes.length }
    it { is_expected.to eq(4) }
  end

  describe 'validations' do
    describe 'name' do
      context 'when it is empty' do
        before { @ingredient = Ingredient.new(name: '') }
        subject { @ingredient }

        it { is_expected.to be_invalid }
      end

      context 'when it is not empty' do
        subject { Ingredient.new(name: 'Valid ingredient') }

        it { is_expected.to be_valid }
      end

      context 'when an ingredient with the same name exists' do
        before do
          unless Ingredient.find_by(name: 'Ingredient 1')
            Ingredient.create!(name: 'Ingredient 1')
          end
        end

        subject { Ingredient.new(name: 'Ingredient 1') }

        it { is_expected.to be_invalid }
      end
    end
  end
end
