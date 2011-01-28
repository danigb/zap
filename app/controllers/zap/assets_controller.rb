class Zap::AssetsController < Zap::AdminController
  respond_to :html, :xml, :js
  before_filter :load_sources
  def index
    @assets  = Zap::Asset.all
    respond_with @assets
  end

  def new
    @asset = Asset.new(:space => @space, :user => @user)
  end

  def create
    @asset = @source.assets.build(params[:asset])
    flash[:notice] = "Fichero subido" if @asset.save
    redirect_to @source
  end

  def edit
    @asset = @source.assets.find params[:id]
  end

  def update
    @asset = @source.assets.find params[:id]
    @asset.update_attributes(params[:asset])
    if @asset.save
      flash[:notice] = "Fichero actualizado"
      redirect_to @source
    else
      render :action => 'edit'
    end
  end

  protected

  def load_sources
    @source = @space = Space.find(params[:space_id]) if params[:space_id]
    @user = User.find params[:user_id] if params[:user_id]
  end
end
