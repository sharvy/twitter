import React, { useState } from "react";
import HomeIndex from "./HomeIndex";
import PropTypes from "prop-types";
import HomeContext from "./HomeContext";
import { ActionCableProvider } from "use-action-cable";

const HomeContainer = (props) => {
  const { tweetsUrl, allTweets, isLoggedIn, signInUrl } = props;
  const [allUserTweets, setAllUserTweets] = useState(allTweets);

  return (
    <HomeContext.Provider
      value={{
        isLoggedIn,
        signInUrl,
        tweetsUrl,
        allUserTweets,
        setAllUserTweets,
      }}
    >
      <ActionCableProvider url="/cable">
        <HomeIndex />
      </ActionCableProvider>
    </HomeContext.Provider>
  );
};

HomeContainer.propTypes = {
  tweetsUrl: PropTypes.string.isRequired,
  allTweets: PropTypes.array.isRequired,
};

export default HomeContainer;
