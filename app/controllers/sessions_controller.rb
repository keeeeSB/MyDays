class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = login(params[:session][:email], params[:session][:password])
    if user
      if user.activated?
        flash[:success] = "ログインしました。"
        redirect_to user
      else
        flash[:warning] = "アカウントが承認されていません。"
        redirect_to root_path
      end
    else
      flash.now[:danger] = "メールアドレス、又はパスワードが間違っています。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました。"
    redirect_to root_path, status: :see_other
  end
end
