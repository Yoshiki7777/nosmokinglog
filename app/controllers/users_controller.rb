class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update, :destroy]
skip_before_action :login_required, only: :new
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    if @user == current_user
      render "edit"
    else
      redirect_to users_path
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_url, notice: "ユーザー｢#{@user.name}｣を登録しました"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user == @user
  end
end
