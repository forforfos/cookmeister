import { render, screen } from "@testing-library/react";
import Results from "../Results";

describe("Results", () => {
  const recipes = [
    {
      id: 1,
      title: "Banana Bread",
      image: "image_url",
      cooking_time: "1 hour and 20 minutes",
      preping_time: "25 minutes",
      author: { id: 34, name: "Banana Bread Lover" },
      ratings: 4.3,
      ingredients: [
        { id: 2568, name: "2 ripe bananas" },
        { id: 3580, name: "1 package of all-purpose flour" },
        { id: 23000, name: "2 cups (4.5 ounces) brown sugar" },
      ],
    },
    {
      id: 2,
      title: "Banana Muffins",
      image: "image_url",
      cooking_time: "40 minutes",
      preping_time: "15 minutes",
      author: { id: 34, name: "Banana Bread Lover" },
      ratings: 4.8,
      ingredients: [
        { id: 2568, name: "2 ripe bananas" },
        { id: 3580, name: "1 package of all-purpose flour" },
        { id: 23000, name: "2 cups (4.5 ounces) brown sugar" },
      ],
    },
  ];

  test("renders recipe cards when provided", () => {
    render(<Results recipes={recipes} />);

    const images = document.getElementsByClassName("card-image");
    expect(images.length).toBe(2);
    expect(screen.getByText("Banana Bread")).toBeInTheDocument();
    expect(screen.getByText("Banana Muffins")).toBeInTheDocument();
  });
});
