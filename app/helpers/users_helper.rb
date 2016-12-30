module UsersHelper
  def user_has_no_posts?(post)
    current_user && @user.posts.count == 0
  end
  def user_has_no_comments?(comment)
    current_user && @user.comments.count == 0
  end
end
