import { useEffect, useState } from "react";

const ResultsPage = () => {
  const [books, setBooks] = useState([]);
  useEffect(() => {
    const url = "http://localhost:3000/recipes";

    const options = {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json;charset=UTF-8",
      },
    };

    fetch(url, options)
      .then((response) => response.json())
      .then((data) => setBooks(data));
  }, [setBooks]);

  return(
    <>
      { books.map(book => <div>{book.title}</div>) }
    </>
  )
};

export default ResultsPage;
