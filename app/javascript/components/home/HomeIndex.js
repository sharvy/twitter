import React, { useEffect } from "react";
import Tweets from "../tweets/Tweets";
import Form from "./Form";
import { useHomeContext } from "./HomeContext";
import InternalFeedNavigation from "./Navigation";
import AllUsersTweetsChannel from "../../channels/all_users_tweets_channel";

const HomeIndex = () => {
  useEffect(() => {
    AllUsersTweetsChannel.received = (tweet) => {
      updateTweetsOrComments(tweet);
    };
  }, []);

  const { tweets, setTweets, isLoggedIn } = useHomeContext();

  const updateTweetsOrComments = (tweet) => {
    if (!tweet.parentId) updateTweets(tweet);
    else updateComments(tweet);
  };

  const updateTweets = (tweet) => {
    tweets.unshift(tweet)
    setTweets([...tweets]);
  };

  const updateComments = (comment) => {
    const index = tweets.findIndex((t) => t.id == comment.parentId);
    if (index === -1) return;

    tweets[index].comments = [...tweets[index].comments, comment];
    setTweets([...tweets]);
  };

  const TweetFormSection = () => {
    if (!isLoggedIn) return null;
    return <Form />;
  };

  return (
    <div className="container-fluid">
      {isLoggedIn && <InternalFeedNavigation />}

      <TweetFormSection />
      <Tweets tweets={tweets} />
    </div>
  );
};

export default HomeIndex;
