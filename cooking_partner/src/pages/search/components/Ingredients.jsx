import styled from '@emotion/styled';

const IngredientsWrapper = styled('div')`
  padding: 10px 0;
`;

const Ingredient = styled('div')`
  font-size: 14px;
`

const Ingredients = ({ ingredients }) => {
  return (
    <IngredientsWrapper>
      {ingredients.map((ingredient) => (
        <Ingredient key={ingredient.id}>{ingredient.name}</Ingredient>
      ))}
    </IngredientsWrapper>
  );
};

export default Ingredients;
