const FollowToggle = require("./follow_toggle");

module.exports = {
  followUser(id) {
    return $.ajax({
      dataType: "json",
      method: "POST",
      url: `/users/${id}/follow`
    });
  },

  unfollowUser(id) {
    return $.ajax({
      dataType: "json",
      method: "DELETE",
      url: `/users/${id}/follow`
    });
  }
};

// module.exports = {
//   followUser: followUser,
//   unfollowUser: unfollowUser
// };
