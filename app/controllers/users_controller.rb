class UsersController < ApplicationController
  def new
  end

  #GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそ!  登録完了"
      redirect_to @user 
      #redirect_to user_path(@user) => user_path(@user.id)
      #user.idが1なら /users/1になる  
      #get /users/#{@user.id}
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
