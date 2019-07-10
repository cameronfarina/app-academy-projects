const APIUtil = require("./api_util");

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find(".input-search");
    this.$ul = this.$el.find(".users");

    this.$input.on("input", this.handleInput.bind(this));
  }

  handleInput(e) {
    e.preventDefault();

    APIUtil.searchUsers(this.$input.val()).then(users =>
      this.renderResults(users)
    );
  }

  renderResults(users) {
    this.$ul = [];
 
    for (let i = 0; i < users.length; i++) {
    //   console.log('were in here');
      let currentUser = users[i];
      const $li = $("<li>");
      let $a = $("<a>");
      $a.text(`${currentUser.username}`);
      $a.attr("href", `/users/${currentUser.id}`);

      $li.append($a);
      this.$ul.append($li);
    }
  }
}

module.exports = UsersSearch;
