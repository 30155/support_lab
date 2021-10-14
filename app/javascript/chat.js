function scroll() {
  if (document.URL.match(/message/)) {
  const messageDetails = document.getElementById('message_area');
  messageDetails.scrollTop = messageDetails.scrollHeight;

  url = document.referrer;
  history.replaceState(null, null, url);
  }
}

window.addEventListener('load', scroll)
