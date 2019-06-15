class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Signed in"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out"
    redirect_to root_url
  end

  private

    def sign_in(user)
      token = User.random_token
      user.update_attribute(:remember_digest, User.digest(token))
      cookies.permanent[:user_token] = token
      self.current_user = user
    end

    def sign_out
      current_user.update_attribute(:remember_digest, nil)
      cookies.delete(:user_token)
      self.current_user = nil
    end
end
