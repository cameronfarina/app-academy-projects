const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

$(function() {
  $('button.follow-toggle').each((i, button) => new FollowToggle(button));
  $('.users-search').each((i, nav) => new UsersSearch(nav));
});
