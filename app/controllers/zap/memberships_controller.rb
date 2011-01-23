class Zap::MembershipsController < Zap::AdminController
  before_filter :load_source
  
  def new
    @membership = @source.memberships.build
    respond_with @membership
  end

  def edit
    @membership = @source.memberships.find params[:id]
    respond_with @membership
  end

  def show
    redirect_to @source
  end

  def create
    @membership = @source.memberships.build(params[:membership])
    @membership.save
    respond_with @membership
  end

  protected
  def load_source
    @source = User.find params[:user_id] if params[:user_id]
    @source = Space.find params[:space_id] if params[:space_id]
  end

end