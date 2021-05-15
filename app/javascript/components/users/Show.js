import axios from "axios";
import React, { useState } from "react";
import { axiosHeaders } from "../shared/utils";
import Tweets from "../tweets/Tweets";

const Show = ({ currentUser, user, following, tweets }) => {
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
      <div className="jumbotron">
        <h1>{user.fullName}</h1>
        <p>
          <FollowButton />
        </p>
      </div>
      <div>
        <button class="btn btn-primary mr-2 disabled" type="button">
          Following <span class="badge">{user.followeesCount}</span>
        </button>
        <button class="btn btn-primary mr-2 disabled" type="button">
          Followers <span class="badge">{user.followersCount}</span>
        </button>
      </div>
      <Tweets tweets={tweets} />
    </div>
  );
};

export default Show;
