const APIUtil = require("./api_util");

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();

    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.prop("disabled", false);
      this.$el.html("Follow!");
    } else if (this.followState === "followed") {
      this.$el.prop("disabled", false);
      this.$el.html("Unfollow!");
    } else if (this.followState === "following") {
      this.$el.prop("disabled", true);
      this.$el.html("Following");
    } else if (this.followState === "unfollowing") {
      this.$el.prop("disabled", true);
      this.$el.html("Unfollowing");
    }
  }

  handleClick(e) {
    e.preventDefault();

    if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId).then(() => this.followUserCb());
    } else if (this.followState === "followed") {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId).then(() => this.unfollowUserCb());
    }
  }

  unfollowUserCb() {
    this.followState = "unfollowed";
    this.render();
  }
  followUserCb() {
    this.followState = "followed";
    this.render();
  }

  // errorCb() {

  // }
}

module.exports = FollowToggle;
