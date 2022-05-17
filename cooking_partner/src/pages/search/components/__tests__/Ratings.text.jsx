import {fireEvent, render, screen} from '@testing-library/react';
import Ratings from '../Ratings';

describe('Ratings', () => {
  const STAR = '\u{02605}';

  test('renders corrently and is not editable', () => {
    render(<Ratings rating={4.2} />);

    const stars = screen.getAllByText(STAR);

    expect(stars.length).toBe(5);
    expect(stars[0]).toHaveStyle('color: rgb(255, 215, 0)');
    expect(stars[1]).toHaveStyle('color: rgb(255, 215, 0)');
    expect(stars[2]).toHaveStyle('color: rgb(255, 215, 0)');
    expect(stars[3]).toHaveStyle('color: rgb(255, 215, 0)');
    expect(stars[4]).toHaveStyle('color: gray');

    fireEvent.click(stars[2]);

    expect(stars[3]).not.toHaveStyle('color: gray');
  });
});
