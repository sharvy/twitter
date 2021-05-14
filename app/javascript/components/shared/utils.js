export const axiosHeaders = (document) => {
  const csrfMeta = document.querySelector("meta[name='csrf-token']");
  return {
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": csrfMeta ? csrfMeta.getAttribute("content") : "",
    },
  };
};
