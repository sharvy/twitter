import React from "react";
import { useHomeContext } from "../home/HomeContext";
import CommentForm from "./CommentForm";
import Comments from "./Comments";

const Tweet = ({ tweet }) => {
  const { isLoggedIn } = useHomeContext();
  const { id, text, author, comments } = tweet;

  return (
    <div className="card mt-5 mb-5">
      <div className="card-header">
        <div className="justify-content-between align-items-center">
          <div className="justify-content-between align-items-center">
            <div>
              <a className="h7" href={author.profileUrl}>
                {author.fullName}
              </a>
            </div>
          </div>
        </div>
      </div>
      <div className="card-body">
        <p className="card-text">{text}</p>
      </div>
      <div className="card-footer">
        {isLoggedIn && <CommentForm parentId={id} />}
        <Comments comments={comments} />
      </div>
    </div>
  );
};

export default Tweet;
