class Zap::SessionsController < ApplicationController
  layout 'zap/admin'
  helper Zap::ZapHelper
  include AuthModule
  helper_method :current_user

  def new
  end

  def show
  end

  if Rails.env == :test
    def enter
      self.current_user = Zap::User.find(params[:id])
    end
  end


  def create
    auth = request.env['rack.auth']
    unless @auth = Zap::Authorization.find_from_auth(auth)
      @auth = Zap::Authorization.create_from_auth(auth, current_user)
    end
    self.current_user = @auth.user

    redirect_to stored_or(root_path)
  end

  def destroy
    self.clear_user
    redirect_to root_path
  end
end
