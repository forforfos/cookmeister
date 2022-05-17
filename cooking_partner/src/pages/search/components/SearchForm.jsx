import { useState } from "react";
import MultipleValueTextInput from "react-multivalue-text-input";
import styled from "@emotion/styled";

const Form = styled("form")`
  width: 470px;
  float: right;
  padding: 16px 42px;
  display: flex;
  flex-direction: column;
  align-items: center;

  & .multiple-value-text-input {
    display: flex;
    align-self: stretch;

    label {
      display: flex;
      flex-direction: column-reverse;
      align-items: end;

      .multiple-value-text-input-item-container {
        height: 250px;

        & .multiple-value-text-input-item {
          float: right;
          padding: 6px 14px;
          margin-bottom: 10px;
          background: #ccc;
          margin-right: 5px;
          border-radius: 24px;
          background: #a93238;
          color: #e8d8d8;
          box-shadow: 3px 3px 12px #333;
        }
      }

      & input {
        height: 40px;
        border-radius: 30px;
        border: none;
        text-align: right;
        background: #e8d8d8;
        box-shadow: 3px 3px 12px #333;
        text-align: left;
        padding: 4px 20px;
      }
    }
  }

  @media screen and (max-width: 420px) {
    width: 100%;

    & .multiple-value-text-input label {
      .multiple-value-text-input-item-container {
        height: 200px;
      }
    }
  }
`;

const SubmitButton = styled("input")`
  width: 300px;
  height: 36px;
  text-align: center;
  border-radius: 30px;
  border: none;
  font-size: 20px;
  font-weight: 600;
  background: #a93238;
  color: #e8d8d8;
  box-shadow: 3px 3px 12px #333;
  cursor: pointer;
  transition: all 0.3s;

  &:hover {
    transform: scale(1.05);
  }
`;

const SearchForm = ({ setRecipes }) => {
  const [ingredients, setIngredients] = useState([]);

  const handleSubmit = (e) => {
    e.preventDefault();
    const url = `${process.env.REACT_APP_COOKMEISTER_URL}/recipes/search`;
    const options = {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json;charset=UTF-8",
      },
      body: JSON.stringify({
        ingredients: ingredients,
      }),
    };

    fetch(url, options)
      .then((response) => response.json())
      .then((data) => setRecipes(data));
  };

  const handleIngredientAddition = (item) => {
    setIngredients([...ingredients, item]);
  };

  const handleIngredientDeletion = (item) => {
    setIngredients(ingredients.filter((ingredient) => ingredient !== item));
  };

  return (
    <Form onSubmit={handleSubmit}>
      <MultipleValueTextInput
        name="ingredients"
        onItemDeleted={handleIngredientDeletion}
        onItemAdded={handleIngredientAddition}
      />
      <SubmitButton data-testid="submitButton" type="submit" value="Find Recipes" />
    </Form>
  );
};

export default SearchForm;
