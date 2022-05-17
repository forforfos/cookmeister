import styled from "@emotion/styled";

const WelcomeMessage = styled('div')`
  color: white;
  text-align: right;
  font-size: 55px;
  margin: 20px 40px 0 0;

  @media screen and (max-width: 943px) {
    font-size: 40px;
  }

  @media screen and (max-width: 420px) {
    font-size: 36px;
  }
`;

const SubHeader = styled('div')`
  color: white;
  text-align: right;
  font-size: 20px;
  margin: 10px 40px 0 0;

  @media screen and (max-width: 420px) {
    font-size: 18px;
  }

  @media screen and (max-width: 696px) {
    font-size: 16px;
  }
`;

const SearchFormHeader = () => (
  <>
    <WelcomeMessage>Welcome to your cooking partner</WelcomeMessage>
    <SubHeader>1. Enter your ingredient</SubHeader>
    <SubHeader>2. Press ENTER</SubHeader>
    <SubHeader>3. Do the same for all ingredients you have</SubHeader>
    <SubHeader>4. Find a recipe that you like</SubHeader>
  </>
)

export default SearchFormHeader;
