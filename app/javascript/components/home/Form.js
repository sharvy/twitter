import axios from "axios";
import React, { useState } from "react";
import { useHomeContext } from "./HomeContext";

const Form = () => {
  const { tweetsUrl, allUserTweets, setAllUserTweets } = useHomeContext();
  const [text, setText] = useState("");
  const [submitting, setSubmitting] = useState(false);

  const submit = (e) => {
    e.preventDefault();
    setSubmitting(true);

    const params = {
      tweet: {
        text: text,
      },
    };

    axios
      .post(tweetsUrl, params)
      .then((response) => {
        updateAllUserTweets(response.data);
        setSubmitting(false);
        setText("");
      })
      .catch((error) => {
        console.log(error);
        setSubmitting(false);
      });
  };

  const updateAllUserTweets = (tweet) => {
    setAllUserTweets([tweet, ...allUserTweets]);
  };

  return (
    <form>
      <input
        type="text"
        value={text}
        onChange={(e) => setText(e.target.value)}
        placeholder="Your tweet..."
      />
      <button disabled={submitting} onClick={submit}>Tweet</button>
    </form>
  );
};

export default Form;
