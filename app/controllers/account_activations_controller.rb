class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      reset_session
      login user
      flash[:success] = "アカウントを承認しました。ログインしてください。"
      redirect_to login_path
    else
      flah[:danger] = "無効なリンクです。"
      redirect_to root_path
    end
  end
end
