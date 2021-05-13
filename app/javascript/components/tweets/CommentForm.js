import axios from "axios";
import React, { useState } from "react";
import snakeCaseKeys from "snakecase-keys";
import { useHomeContext } from "../home/HomeContext";

const CommentForm = ({ parentId }) => {
  const { tweetsUrl } = useHomeContext();
  const [submitting, setSubmitting] = useState(false);
  const [text, setText] = useState("");

  const submit = (e) => {
    e.preventDefault();
    setSubmitting(true);

    const params = snakeCaseKeys({
      tweet: {
        text: text,
        parentId: parentId,
      },
    });

    axios
      .post(tweetsUrl, params)
      .then((response) => {
        setSubmitting(false);
        setText("");
      })
      .catch((error) => {
        console.log(error);
        setSubmitting(false);
      });
  };

  return (
    <>
      <div className="input-group input-group">
        <input
          type="text"
          className="form-control"
          value={text}
          onChange={(e) => setText(e.target.value)}
          placeholder="Your comment..."
        />
        <div className="input-group-append">
          <button
            disabled={submitting}
            onClick={submit}
            className="text-decoration-none text-white btn btn-primary"
          >
            Comment
          </button>
        </div>
      </div>
    </>
  );
};

export default CommentForm;
