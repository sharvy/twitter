import React from "react";

const Comment = ({ comment }) => {
  const { author, text } = comment;

  return (
    <div className="card mt-2">
      <div class="card-header m-0 p-2">
        <div className="h7 text-muted">{author}</div>
      </div>

      <div className="card-body">
        <p className="card-text">{text}</p>
      </div>
    </div>
  );
};

export default Comment;
