class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");

    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else {
      this.$el.text("Unfollow!");
    }
  }

  handleClick(e) {
    e.preventDefault();

    if (this.followState === "unfollowed") {
      $.ajax({
        method: "POST",
        url: "/users/:id/follow",
        dataType: "json",
        data: this.$el,
        success: () => {
          this.followState = "followed";
          this.render();
        }
      });
    } else {
      $.ajax({
        method: "DELETE",
        url: "/users/:id/follow",
        dataType: "json",
        data: this.$el,
        success: () => {
          this.followState = "unfollowed";
          this.render();
        }
      });
    }

  }
}

module.exports = FollowToggle;
