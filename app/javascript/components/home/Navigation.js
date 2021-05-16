import React from "react";

const InternalFeedNavigation = () => {
  const isGlobal = window.location.href.includes("/global");
  const activeHome = isGlobal ? "" : "active";
  const activeGlobal = isGlobal ? "active" : "";

  return (
    <div className="row justify-content-center">
      <ul className="nav nav-pills justify-content-center">
        <li className="nav-item">
          <a className={`nav-link ${activeHome}`} aria-current="page" href="/">
            Home
          </a>
        </li>
        <li className="nav-item">
          <a
            className={`nav-link ${activeGlobal}`}
            aria-current="page"
            href="/global"
          >
            Global
          </a>
        </li>
      </ul>
    </div>
  );
};

export default InternalFeedNavigation;
