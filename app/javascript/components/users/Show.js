import axios from "axios";
import React, { useState } from "react";
import { axiosHeaders } from "../shared/utils";

const Show = ({ currentUser, user, following }) => {
  const [isFollowing, setIsFollowing] = useState(following);
  const followable = currentUser.id == user.id ? false : true;

  const followUnfollow = (e) => {
    e.preventDefault();
    const url = isFollowing ? user.unfollowUrl : user.followUrl;
    axios
      .post(url, {}, axiosHeaders(document))
      .then((response) => setIsFollowing(response.data.following))
      .catch((error) => console.log(error));
  };

  const FollowButton = () => {
    if (!followable) return null;

    return (
      <button onClick={followUnfollow} className="btn btn-lg btn-primary">
        {isFollowing ? "Unfollow" : "Follow"}
      </button>
    );
  };

  return (
    <div className="container">
      <div className="bg-light p-5 rounded mt-3">
        <h1>{user.fullName}</h1>
        <FollowButton />
      </div>
    </div>
  );
};

export default Show;
