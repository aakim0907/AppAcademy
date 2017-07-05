const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el) {
    this.$button = $(el);
    this.userId = this.$button.data("user-id");
    this.followState = this.$button.data("initial-follow-state");

    this.render();
    this.$button.on("click", this.handleClick.bind(this));
  }

  render() {
    switch(this.followState){
      case "followed":
        this.$button.prop("disabled", false);
        this.$button.text("Unfollow");
        break;
      case "unfollowed":
        this.$button.prop("disabled", false);
        this.$button.text("Follow");
        break;
      case "following":
        this.$button.prop("disabled", true);
        this.$button.text("(following...)");
        break;
      case "unfollowing":
        this.$button.prop("disabled", true);
        this.$button.text("(unfollowing...)");
        break;
    }
  }

  handleClick(event) {
    const button = this;

    event.preventDefault();

    if (this.followState === "followed") {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId).then(() => {
        button.followState = "unfollowed";
        button.render();
      });
    } else if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId).then(() => {
        button.followState = "followed";
        button.render();
      });
    }
  }

}

module.exports = FollowToggle;
