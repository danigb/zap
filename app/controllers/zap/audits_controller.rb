class Zap::AuditsController < Zap::AdminController

  def index
    @audits = Zap::Audit.all
  end
end
