class UsersController < ApplicationController
  before_action :require_user_logged_in,only:[:index,:show,:followings,:followers,:likes]
  # before_action :correct_user,only:[:edit]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end 
  
  def edit 
    @user = User.find(params[:id])
  end 
  
  def update 
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました'
      redirect_to @user
    else 
      flash.now[:danger] = 'ユーザー情報の更新に失敗しました'
      render :edit
    end
  end 
  
  def destroy 
    @user = User.find_by(id: params[:id])
    @microposts = Micropost.find_by(user_id: params[:id])
    flash[:success] = "ユーザーを削除しました"

    if @microposts.nil?
      @user.destroy
      redirect_to("/")
    else
      @microposts.destroy
      @user.destroy
      redirect_to("/")
    end
  end 
      
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end 
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end 
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
    @microposts = @user.like_microposts.order('created_at DESC').page(params[:page])
    counts(@user)
  end 
  
  private 

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:age,:gender,:picture)
  end 
  
  # def correct_user
  #   @user = current_user
  #   unless @user
  #   redirect_to root_url
  #   end 
  # end 
end
