class AdvicePostsController < ApplicationController
before_action :protect_user, only: [:edit, :destroy, :update]

  def new
    @advice_post = AdvicePost.new
  end

  def index
    @advice_posts = AdvicePost.all
  end

  def show
    @advice_post = AdvicePost.find(params[:id])
    @user = User.find_by(id: @advice_post.user_id)
  end

  def edit
    @advice_post = current_user.advice_posts.find(params[:id])
    if @advice_post.user_id == current_user.id
      render 'edit'
    else
      redirect_to advice_posts_path
    end
  end

  def update
    @advice_post = current_user.advice_posts.find(params[:id])
    if @advice_post.update(advice_post_params)
      redirect_to advice_posts_url, notice: '投稿を更新しました'
    else
      render :new
    end
  end

  def create
    @advice_post = current_user.advice_posts.new(advice_post_params)

    if @advice_post.save!
      redirect_to @advice_post, notice: "投稿を登録しました！"
    else
      render :new
    end
  end

  def destroy
    advice_post = current_user.advice_posts.find(params[:id])
    advice_post.destroy
    redirect_to advice_posts_url, notice: '投稿を削除しました'
  end

  private

  def advice_post_params
    params.require(:advice_post).permit(:description)
  end

  def protect_user
    unless AdvicePost.find(params[:id]).user.id == current_user.id
      redirect_to advice_posts_path(current_user)
    end
  end
end
