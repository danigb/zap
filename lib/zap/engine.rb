require 'rails'
require 'omniauth'
require 'sentient_user'
require 'simple_audit'

module Zap
  class Engine < Rails::Engine
    isolate_namespace Zap

    SimpleAudit.user_class_name = "Zap::User"

    initializer "zap.omniauth_middleware" do |app|
      app.middleware.use OmniAuth::Builder do
        # #provider :open_id, OpenID::Store::Filesystem.new('/tmp')
        provider :openid, nil, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
      end
    end
  end
end