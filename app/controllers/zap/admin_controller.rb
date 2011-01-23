

class Zap::AdminController < ApplicationController
  layout 'zap/admin'
  include Zap::AuthModule
  helper_method :current_user
  helper Zap::ZapHelper
  self.responder = Zap::ZapResponder
  respond_to :html, :xml, :json
  before_filter :require_admin
  before_filter do |c|
    Zap::User.current = c.send(:current_user)
  end
  
  def resource_class
    self.class.name[0..-12].constantize
  end
end