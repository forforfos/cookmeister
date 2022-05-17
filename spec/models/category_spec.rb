RSpec.describe 'Category', type: :model do
  before do
    @category = build :category
  end

  subject { @category }

  describe 'attribute_accessors' do
    it { is_expected.to respond_to(:title, :title=) }
    it { is_expected.to respond_to(:recipes, :recipes=) }
  end

  describe 'validations' do
    describe 'title' do
      context 'when it is empty' do
        before { @category.title = '' }

        it { is_expected.to be_invalid }
      end

      context 'when it is not empty' do
        before { @category.title = 'Valid category' }

        it { is_expected.to be_valid }
      end

      context 'when a category with the same name exists' do
        before do
          unless Category.find_by(title: 'Category 1')
            Category.create!(title: 'Category 1')
          end
          @category.title = 'Category 1'
        end

        it { is_expected.to be_invalid }
      end
    end
  end
end
