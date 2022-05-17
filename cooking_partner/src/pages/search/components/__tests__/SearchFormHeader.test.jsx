import { fireEvent, render, screen } from "@testing-library/react";
import SearchFormHeader from "../SearchFormHeader";

describe("SearchFormHeader", () => {
  test("renders all components correctly", () => {
    render(<SearchFormHeader />);

    expect(
      screen.getByText("Welcome to your cooking partner")
    ).toBeInTheDocument();
    expect(screen.getByText("1. Enter your ingredient")).toBeInTheDocument();
    expect(screen.getByText("2. Press ENTER")).toBeInTheDocument();
    expect(
      screen.getByText("3. Do the same for all ingredients you have")
    ).toBeInTheDocument();
    expect(
      screen.getByText("4. Find a recipe that you like")
    ).toBeInTheDocument();
  });
});
