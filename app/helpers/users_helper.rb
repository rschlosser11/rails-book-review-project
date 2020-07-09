module UsersHelper
  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def is_reviewer?
    current_user.reviewer if current_user
  end

  def can_edit_review(review)
    is_reviewer? && review.user_id == current_user.id
  end

  def become_reviewer(user)
    if !user.reviewer
    end
  end
end
