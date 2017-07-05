const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(button) {
    this.$button = $(button);
    this.userId = this.$button.data("user-id");
    this.followState = this.$button.data("initial-follow-state");

    this.render();
    this.$button.on('click', this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$button.text("Follow");
    } else {
      this.$button.text("Unfollow");
    }
  }

  handleClick(event) {
    event.preventDefault();

    if (this.followState === "unfollowed") {
      APIUtil.followUser(this.userId).then(() => {
        this.followState = "followed";
        this.render();
      });
    } else if (this.followState === "followed") {
      APIUtil.unfollowUser(this.userId).then(() => {
        this.followState = "unfollowed";
        this.render();
      });
    }

  }
}

module.exports = FollowToggle;
