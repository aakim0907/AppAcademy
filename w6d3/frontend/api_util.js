const APIUtil = {
  followUser: id => APIUtil.changeFollowStatus(id, "POST"),

  unfollowUser: id => APIUtil.changeFollowStatus(id, "DELETE"),

  changeFollowStatus: (id, method) => (
    $.ajax({
      method: `${method}`,
      url: `/users/${id}/follow`,
      dataType: "json"
    })
  )
};


module.exports = APIUtil;
