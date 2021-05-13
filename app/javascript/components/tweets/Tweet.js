import React from "react";
import CommentForm from "./CommentForm";
import Comments from "./Comments";

const Tweet = ({ tweet }) => {
  const { id, text, author, comments } = tweet;

  return (
    <div className="card mt-5 mb-5">
      <div className="card-header">
        <div className="justify-content-between align-items-center">
          <div className="justify-content-between align-items-center">
            <div>
              <div className="h7 text-muted">{author}</div>
            </div>
          </div>
        </div>
      </div>
      <div className="card-body">
        <p className="card-text">{text}</p>
      </div>
      <div className="card-footer">
        <CommentForm parentId={id} />
        <Comments comments={comments} />
      </div>
    </div>
  );
};

export default Tweet;
