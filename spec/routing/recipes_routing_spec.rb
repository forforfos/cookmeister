require 'rails_helper'

describe '/search', type: :routing do
  it 'routes /recipes/search to recipe#search' do
    expect({ post: '/recipes/search' }).to(
      route_to(
        controller: 'recipes',
        action: 'search'
      )
    )
  end
end