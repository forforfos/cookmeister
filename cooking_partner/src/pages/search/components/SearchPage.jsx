import { useState } from "react";
import styled from "@emotion/styled";
import SearchForm from "./SearchForm";
import headerImage from "../../../assets/flatlay.jpg"
import SearchFormHeader from "./SearchFormHeader";
import Results from "./Results";

const HeaderImage = styled('div')`
  width: 100%;
  height: 600px;
  background-image: url(${headerImage});
  background-position: bottom;
  background-size: cover;
  overflow: hidden;

  @media screen and (max-width: 480px) {
    height: 100vh;
  }
`;

const SearchPage = () => {
  const [recipes, setRecipes] = useState([]);

  return (
    <>
      <HeaderImage>
        <SearchFormHeader />
        <SearchForm setRecipes={setRecipes} />
      </HeaderImage>
      { recipes && <Results recipes={recipes} /> }
    </>
  )
};

export default SearchPage;
