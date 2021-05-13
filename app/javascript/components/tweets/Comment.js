import React from "react";

const Comment = ({ comment }) => {
  const { author, text } = comment;

  return (
    <div className="card mt-2">
      <div className="card-header m-0 p-2">
        <a className="h7" href={author.profileUrl}>
          {author.fullName}
        </a>
      </div>

      <div className="card-body">
        <p className="card-text">{text}</p>
      </div>
    </div>
  );
};

export default Comment;
