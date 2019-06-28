class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def admin?
    Sub.all.each do |sub|
      if sub.moderator_id == @current_user.id
        return true
      end
    end
    false
  end

  def require_admin
    unless admin?
      redirect_to subs_url 
      flash[:errors] = ['you are not an admin']
    end
  end

  def author?
    Post.author == @current_user
  end

  def require_author
    unless author?
      redirect_to user_url(@current_user) 
      flash[:errors] = ['you are not the author of this post']
    end
  end

end
