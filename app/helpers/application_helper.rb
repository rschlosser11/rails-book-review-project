module ApplicationHelper
  def logged_in
    session[:user_id]
  end

  def current_user
    @user = User.find(session[:user_id])
  end

  def navbar_user_link
    if logged_in
      link_to "Welcome, #{current_user.name}", user_path(current_user), class: "navbar-link"
    else
      link_to "Sign Up/Log In", new_user_path, class: "navbar-link"
    end
  end

  def is_reviewer?
    current_user.reviewer
  end
end
