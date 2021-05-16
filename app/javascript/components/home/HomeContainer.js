import React, { useState } from "react";
import HomeIndex from "./HomeIndex";
import PropTypes from "prop-types";
import HomeContext from "./HomeContext";

const HomeContainer = (props) => {
  const { tweetsUrl, allTweets, isLoggedIn } = props;
  const [tweets, setTweets] = useState(allTweets);

  return (
    <HomeContext.Provider
      value={{
        isLoggedIn,
        tweetsUrl,
        tweets,
        setTweets,
      }}
    >
      <HomeIndex />
    </HomeContext.Provider>
  );
};

HomeContainer.propTypes = {
  tweetsUrl: PropTypes.string.isRequired,
  allTweets: PropTypes.array.isRequired,
};

export default HomeContainer;
