import { useState } from "react";

const SearchForm = () => {
  const [ingredients, setIngredients] = useState();

  const handleSubmit = (e) => {
    e.preventDefault();
    const url = 'http://localhost:3000/recipes/search';
    const options = {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json;charset=UTF-8",
      },
      body: JSON.stringify({
        ingredients: [ingredients],
      }),
    };

    fetch(url, options)
      .then(response => response.json())
      .then(data => console.log(data));

    // console.log(response.json());
  }

  return (
    <form onSubmit={handleSubmit}>
      <input
        name="ingredients"
        onChange={(e) => setIngredients(e.target.value)}
        type="text"
      />
      <input type="submit"/>
    </form>
  );
};

export default SearchForm;
