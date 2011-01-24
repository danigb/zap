class Zap::UsersController < Zap::AdminController
  respond_to :html, :xml, :js

  def index
    @users = Zap::User.all
    respond_with @users
  end

  def show
    @user = Zap::User.find params[:id]
    respond_with @user
  end

  def new
    @user = Zap::User.new
    respond_with @user
  end

  def create
    @user = Zap::User.new(params[:user])
    @user.save
    respond_with(@user)
  end

  def edit
    @user = Zap::User.find params[:id]
    respond_with @user
  end

  def update
    @user = Zap::User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with(@user)
  end

  def destroy
    @user = Zap::User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end

