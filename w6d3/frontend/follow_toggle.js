const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");

    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    switch(this.followState){
      case "followed":
        this.$el.prop("disabled", false);
        this.$el.text("Unfollow");
        break;
      case "unfollowed":
        this.$el.prop("disabled", false);
        this.$el.text("Follow");
        break;
      case "following":
        this.$el.prop("disabled", true);
        this.$el.text("(following...)");
        break;
      case "unfollowing":
        this.$el.prop("disabled", true);
        this.$el.text("(unfollowing...)");
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
