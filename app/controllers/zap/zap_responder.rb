require 'responders'

class Zap::ZapResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder
end