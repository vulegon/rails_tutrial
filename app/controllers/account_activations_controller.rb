class AccountActivationsController < ApplicationController
  def edit
   user = User.find_by(email: params[:email])
   if user && !user.activated? && user.authenticated?(:activation,params[:id])
    user.activate
    log_in user
    flash[:success]="アカウントを有効化しました"
    redirect_to user
   else
    flash[:danger] = "アカウント有効化のメールのリンクが有効期限切れ、または正しく有りません･"
    redirect_to root_url
   end
  end
end
