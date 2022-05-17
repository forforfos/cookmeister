require 'rails_helper'

describe RecipesController, type: :controller do
  describe 'POST search' do
    it 'returns empty list when no matches are found' do
      post 'search', params: { "ingredients": [ "flour" ] }

      expect(response.body).to eq("[]")
      expect(response.code).to eq("200")
    end

    it 'returns recipes list when matches are found' do
      stub = Recipe
      allow(stub).to receive(:search) do
        @recipe = { id: 5, title: "Banana bread" }
      end

      post 'search', params: { "ingredients": [ "flour" ] }

      expect(response.body).to eq("{\"id\":5,\"title\":\"Banana bread\"}")
      expect(response.code).to eq("200")
    end
  end
end