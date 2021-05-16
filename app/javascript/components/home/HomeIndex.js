import React from "react";
import Tweets from "../tweets/Tweets";
import Form from "./Form";
import { useHomeContext } from "./HomeContext";
import { useActionCable } from "use-action-cable";
import InternalFeedNavigation from "./Navigation";

const HomeIndex = () => {
  const { tweets, setTweets, isLoggedIn } = useHomeContext();

  const updateTweetsOrComments = (tweet) => {
    if (!tweet.parentId) updateTweets(tweet);
    else updateComments(tweet);
  };

  const updateTweets = (tweet) => {
    const filteredTweets = tweets.filter((t) => t.id != tweet.id);
    setTweets([tweet, ...filteredTweets]);
  };

  const updateComments = (comment) => {
    const index = tweets.findIndex((t) => t.id == comment.parentId);
    if (index === -1) return;

    tweets[index].comments = [...tweets[index].comments, comment];
    setTweets([...tweets]);
  };

  useActionCable(
    { channel: "AllUsersTweetsChannel" },
    { received: (tweet) => updateTweetsOrComments(tweet) }
  );

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
