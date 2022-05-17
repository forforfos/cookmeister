import { fireEvent, render, screen, waitFor } from "@testing-library/react";
import SearchForm from "../SearchForm";

describe("SearchForm", () => {
  const mockedResponse = {
    recipes: [
      { id: 0, title: "Banana Bread" },
      { id: 1, name: "Banana Muffins" },
    ],
  };

  beforeEach(() => {
    global.fetch = jest.fn(() =>
      Promise.resolve({
        json: () => Promise.resolve(mockedResponse),
      })
    );
  });

  afterAll(() => {
    jest.clearAllMocks();
  });

  test("renders all parts of the form", () => {
    const setRecipes = jest.fn();
    render(<SearchForm setRecipes={setRecipes} />);

    const multiTextInput = document.getElementsByClassName(
      "multiple-value-text-input"
    )[0];
    expect(multiTextInput).toBeInTheDocument();

    const selectedIngredientsContainer = document.getElementsByClassName(
      "multiple-value-text-input-item-container"
    )[0];
    expect(selectedIngredientsContainer).toBeInTheDocument();

    expect(screen.getByTestId("submitButton")).toHaveAttribute(
      "value",
      "Find Recipes"
    );
  });

  test("adds ingredients to the list on input ENTER, calls API with selected ingredients and sets response to the state of SearchPage", async () => {
    const setRecipes = jest.fn();
    render(<SearchForm setRecipes={setRecipes} />);

    const multiTextInput = screen.getByRole("textbox");

    fireEvent.change(multiTextInput, { target: { value: "flour" } });
    fireEvent.keyPress(multiTextInput, {
      key: "Enter",
      code: 13,
      charCode: 13,
    });
    fireEvent.change(multiTextInput, { target: { value: "banana" } });
    fireEvent.keyPress(multiTextInput, {
      key: "Enter",
      code: 13,
      charCode: 13,
    });
    fireEvent.change(multiTextInput, { target: { value: "sugar" } });
    fireEvent.keyPress(multiTextInput, {
      key: "Enter",
      code: 13,
      charCode: 13,
    });

    expect(screen.getByText("flour")).toBeInTheDocument();
    expect(screen.getByText("banana")).toBeInTheDocument();
    expect(screen.getByText("sugar")).toBeInTheDocument();

    const selectedIngredientsContainer = document.getElementsByClassName(
      "multiple-value-text-input-item-container"
    )[0];
    expect(selectedIngredientsContainer).toBeInTheDocument();

    const submitButton = screen.getByTestId("submitButton");
    fireEvent.click(submitButton);

    expect(global.fetch).toHaveBeenCalledWith(
      "http://test_url.com/recipes/search",
      {
        body: JSON.stringify({ ingredients: ["flour", "banana", "sugar"] }),
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json;charset=UTF-8",
        },
        method: "POST",
      }
    );

    await waitFor(() => expect(setRecipes).toHaveBeenCalled());
  });
});
