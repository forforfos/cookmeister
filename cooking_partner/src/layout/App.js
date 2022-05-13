import { BrowserRouter, Route, Routes } from "react-router-dom";
import styled from '@emotion/styled'
import SearchPage from "../pages/search";
import ResultsPage from "../pages/results";
import headerImage from "../assets/cheese.jpg"

const Wrapper = styled('div')`
    body {
      margin: 0;
      padding: 0;
    }
`

const HeaderImage = styled('div')`
  width: 100%;
  height: 400px;
  background-image: url(${headerImage});
  background-position: bottom;
  background-size: cover;
`;

const App = () => {
  return (
    <Wrapper>
      <HeaderImage>
        {/*<img alt="header" src={headerImage} />*/}
      </HeaderImage>
      <h1>This is the front end for the Cook Meister app</h1>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<SearchPage />} />
          <Route path="/results" element={<ResultsPage />} />
        </Routes>
      </BrowserRouter>
    </Wrapper>
  );
};

export default App;
