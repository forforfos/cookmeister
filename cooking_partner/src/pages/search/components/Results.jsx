import styled from "@emotion/styled";
import Recipe from "./Recipe";

const RecipesWrapper = styled("div")`
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 50px 3%;
`;

const Results = ({ recipes = [] }) => {
  return (
    <RecipesWrapper>
      {recipes.map((recipe) => (
        <Recipe key={recipe.id} recipe={recipe} />
      ))}
    </RecipesWrapper>
  );
};

export default Results;
