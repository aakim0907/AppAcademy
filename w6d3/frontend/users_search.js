const APIUtil = require("./api_util.js");

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find("input[name=username]");
    this.$ul = this.$el.find(".users");

    this.$input.on("input", this.handleInput.bind(this));
  }

  searchUsers(queryVal, success) {
    
  }

  handleInput (event) {
    if (this.$input.val() === "") {
      this.renderResults([]);
      return;
    }
    APIUtil.searchUsers(this.$input.val()).then(users => this.renderResults(users));
  }
}

module.exports = UsersSearch;
