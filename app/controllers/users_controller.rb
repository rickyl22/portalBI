class UsersController < ApplicationController
  def index
    if(params[:flag])
      @users = User.where("title='Ricardo' ")
    else
      @users = User.all
    end
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to @user
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end
end
