import { render, screen } from '@testing-library/react';
import Recipe from '../Recipe';

describe('Recipe', () => {
  const STAR = '\u{02605}';

  const recipe = {
    title: 'Banana Bread',
    image: 'image_url',
    cooking_time: '1 hour and 20 minutes',
    preping_time: '25 minutes',
    author: { id: 34, name: 'Banana Bread Lover'},
    ratings: 4.3,
    ingredients: [
      { id: 2568, name: '2 ripe bananas'},
      { id: 3580, name: '1 package of all-purpose flour'},
      { id: 23000, name: '2 cups (4.5 ounces) brown sugar'},
    ]
  };

  test('renders all recipe details', () => {
    render(<Recipe recipe={recipe} />);

    const recipeImage = document.getElementsByClassName('card-image')[0];
    expect(recipeImage).toHaveStyle(`background-image: url('${recipe.image}')`)
    screen.getByText('Banana Bread');
    screen.getByText('by: Banana Bread Lover');
    const stars = screen.getAllByText(STAR);

    expect(stars.length).toBe(5);
    screen.getByText('preparation time: 25 minutes');
    screen.getByText('cooking time: 1 hour and 20 minutes');
    screen.getByText('2 ripe bananas');
    screen.getByText('1 package of all-purpose flour');
    screen.getByText('2 cups (4.5 ounces) brown sugar');
  });
});
