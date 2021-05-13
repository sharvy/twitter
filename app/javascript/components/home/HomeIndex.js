import React from "react";
import Tweets from "../tweets/Tweets";
import Form from "./Form";
import { useHomeContext } from "./HomeContext";
import { useActionCable } from "use-action-cable";

const HomeIndex = () => {
  const { allUserTweets, setAllUserTweets, isLoggedIn, signInUrl } =
    useHomeContext();

  const updateAllUserTweets = (tweet) => {
    if (!tweet.parentId) updateTweets(tweet);
    else updateComments(tweet);
  };

  const updateTweets = (tweet) => {
    const filteredTweets = allUserTweets.filter((t) => t.id != tweet.id);
    setAllUserTweets([tweet, ...filteredTweets]);
  };

  const updateComments = (comment) => {
    const index = allUserTweets.findIndex((t) => t.id == comment.parentId);
    if (index === -1) return;

    allUserTweets[index].comments = [...allUserTweets[index].comments, comment];
    setAllUserTweets([...allUserTweets]);
  };

  useActionCable(
    { channel: "AllUsersTweetsChannel" },
    { received: (tweet) => updateAllUserTweets(tweet) }
  );

  const TweetFormSection = () => {
    if (!isLoggedIn) return <a href={signInUrl}>Sign In</a>;
    return <Form />;
  };

  return (
    <div className="container-fluid">
      <TweetFormSection />
      <Tweets tweets={allUserTweets} />
    </div>
  );
};

export default HomeIndex;
