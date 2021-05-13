import React from "react";
import Tweets from "../tweets/Tweets";
import Form from "./Form";
import { useHomeContext } from "./HomeContext";
import { useActionCable } from "use-action-cable";

const HomeIndex = () => {
  const { allUserTweets, setAllUserTweets, isLoggedIn, signInUrl } =
    useHomeContext();

  const updateAllUserTweets = (tweet) => {
    const filteredTweets = allUserTweets.filter((t) => t.id != tweet.id);
    setAllUserTweets([tweet, ...filteredTweets]);
  };

  useActionCable(
    { channel: "AllUsersTweetsChannel" },
    { received: (tweet) => updateAllUserTweets(tweet) }
  );

  const TweetFormSection = () => {
    if (!isLoggedIn) return <a href={signInUrl}>Sign In</a>;

    return (
      <section>
        <Form />
      </section>
    );
  };

  return (
    <div className="container">
      <TweetFormSection />
      <section>
        <Tweets tweets={allUserTweets} />
      </section>
    </div>
  );
};

export default HomeIndex;
