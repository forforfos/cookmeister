import { render, screen } from '@testing-library/react';
import Ingredients from '../Ingredients';

describe('Ingredients', () => {
  const ingredients = [
    { id: 2568, name: '2 ripe bananas'},
    { id: 3580, name: '1 package of all-purpose flour'},
    { id: 23000, name: '2 cups (4.5 ounces) brown sugar'},
  ]
  test('renders correctly', () => {
    render(<Ingredients ingredients={ingredients} />);

    expect(screen.getByText('2 ripe bananas')).toBeInTheDocument();
    expect(screen.getByText('1 package of all-purpose flour')).toBeInTheDocument();
    expect(screen.getByText('1 package of all-purpose flour')).toBeInTheDocument();
  });
});
