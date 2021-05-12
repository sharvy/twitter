import React from "react";
import PropTypes from "prop-types";

const Tweets = ({ tweets }) => {
  return (
    <ul>
      {tweets.map((tweet) => (
        <li key={`tweet${tweet.id}`}>{tweet.text}</li>
      ))}
    </ul>
  );
};

Tweets.propTypes = {
  tweets: PropTypes.array.isRequired,
};

export default Tweets;
