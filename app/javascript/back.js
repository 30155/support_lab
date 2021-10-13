if (document.URL.match(/message/)) {
  url = document.referrer;
  history.replaceState(null, null, url);
}

