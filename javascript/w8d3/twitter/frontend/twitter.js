const FollowToggle = require('./follow_toggle');

$(function() {
  $('button.follow-toggle').each((i, button) => new FollowToggle(button))
});
