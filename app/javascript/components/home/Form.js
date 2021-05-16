import axios from "axios";
import React, { useState } from "react";
import { useHomeContext } from "./HomeContext";

const Form = () => {
  const { tweetsUrl } = useHomeContext();
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
      .then((response) => console.log(response))
      .catch((error) => {
        console.log(error);
      });
  };

  return (
    <div className="row justify-content-md-center">
      <div className="col-md-6">
        <div className="card mt-2">
          <div className="card-header"></div>
          <div className="card-body">
            <div className="form-group">
              <textarea
                value={text}
                className="form-control"
                rows="3"
                placeholder="Your tweet..."
                onChange={(e) => setText(e.target.value)}
              ></textarea>
            </div>
            <div className="btn-toolbar justify-content-between">
              <div className="btn-group">
                <button
                  type="submit"
                  className="btn btn-primary"
                  disabled={submitting}
                  onClick={submit}
                >
                  Tweet
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Form;
