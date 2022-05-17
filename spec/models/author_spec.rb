RSpec.describe 'Author', type: :model do
  before do
    @author = build :author
  end

  subject { @author }

  describe 'attribute_accessors' do
    it { is_expected.to respond_to(:name, :name=) }
    it { is_expected.to respond_to(:recipes, :recipes=) }
  end

  describe 'validations' do
    describe 'name' do
      context 'when it is empty' do
        before { @author.name = '' }

        it { is_expected.to be_invalid }
      end

      context 'when it is not empty' do
        before { @author.name = 'Valid author name' }

        it { is_expected.to be_valid }
      end

      context 'when an author with the same name exists' do
        before do
          unless Author.find_by(name: 'Some amazing person that shares recipes with the world')
            Author.create!(name: 'Some amazing person that shares recipes with the world')
          end
          @author.name = 'Some amazing person that shares recipes with the world'
        end

        it { is_expected.to be_invalid }
      end
    end
  end
end
