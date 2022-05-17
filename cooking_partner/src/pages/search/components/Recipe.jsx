import styled from "@emotion/styled";
import Ratings from "./Ratings";
import Ingredients from "./Ingredients";

const Card = styled("div")`
  flex: 0 1 31%;
  margin-bottom: 50px;
  box-shadow: 3px 3px 12px #666;
  transition: all 0.3s;

  &:hover {
    transform: scale(1.1);

    & .card-image {
      height: 220px;
    }
  }

  @media screen and (min-width: 581px) and (max-width: 912px) {
    flex: 0 1 49%;
  }

  @media screen and (max-width: 580px) {
    flex: 1 1 100%;
  }
`;

const CardDetails = styled("div")`
  padding: 10px 16px;
`;

const RecipeImage = styled("div")`
  width: 100%;
  height: 200px;
  background-image: url("${({ image_src }) => image_src}");
  background-size: cover;
  background-position: 0 40%;
  transition: all 0.3s;
`;

const Title = styled("div")`
  font-weight: 500;
  font-size: 18px;
`;

const Author = styled("div")`
  font-size: 12px;
`;

const Duration = styled("div")`
  font-size: 12px;
`;

const Recipe = ({ recipe = {} }) => {
  return (
    <Card>
      <RecipeImage className="card-image" image_src={recipe.image} />
      <CardDetails>
        <Title>{recipe.title}</Title>
        <Author>by: {recipe.author?.name}</Author>
        <Ratings rating={recipe.ratings} />
        <Duration>preparation time: {recipe.preping_time}</Duration>
        <Duration>cooking time: {recipe.cooking_time}</Duration>
        <Ingredients ingredients={recipe.ingredients} />
      </CardDetails>
    </Card>
  );
};

export default Recipe;
