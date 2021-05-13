import React from "react";
import PropTypes from "prop-types";
import Tweet from "./Tweet";

const Tweets = ({ tweets }) => {
  return (
    <div className="row justify-content-md-center">
      <div className="col-md-6">
        {tweets.map((tweet) => (
          <Tweet key={`tweet-${tweet.id}`} tweet={tweet} />
        ))}
      </div>
    </div>
  );
};

Tweets.propTypes = {
  tweets: PropTypes.array.isRequired,
};

export default Tweets;
