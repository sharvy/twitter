import React from "react";
import { useHomeContext } from "./HomeContext";

const FeedNavigation = () => {
  const { feedType, setFeedType, isLoggedIn } = useHomeContext();
  const feedFollowingActive = feedType == "following" ? "active" : "";
  const feedGlobalActive = feedType == "global" ? "active" : "";

  const FeedFollowingTab = () => {
    if (!isLoggedIn) return null;

    return (
      <li className="nav-item">
        <a
          className={`nav-link ${feedFollowingActive}`}
          onClick={() => setFeedType("following")}
          href="#"
        >
          Feed (Following)
        </a>
      </li>
    );
  };

  const FeedGlobalTab = () => {
    return (
      <li className="nav-item">
        <a
          className={`nav-link ${feedGlobalActive}`}
          onClick={() => setFeedType("global")}
          href="#"
        >
          Feed (Global)
        </a>
      </li>
    );
  };

  return (
    <ul className="nav nav-tabs">
      <FeedFollowingTab />
      <FeedGlobalTab />
    </ul>
  );
};

export default FeedNavigation;
