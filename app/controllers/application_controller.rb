class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# If no value set @current_user to User session
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # Access @current_user in our view files
  helper_method :current_user

#Use to restrict pages from non authenticated users - add 'before-filter :authorize'
  def authorize
    redirect_to 'login' unless current_user
  end

  private

  def cart
    # value = cookies[:cart] || JSON.generate({})
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

end
