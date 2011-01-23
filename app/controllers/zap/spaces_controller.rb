
class Zap::SpacesController < Zap::AdminController
  respond_to :html, :xml, :json
  #after_filter { |controller| Zap::Activity.register(controller, current_user) }

  def index
    @spaces = Zap::Space.all
    respond_with @spaces
  end

  def show
    @space = Zap::Space.find params[:id]
    respond_with @space
  end

  def new
    @space = Zap::Space.new
    respond_with @space
  end

  def create
    @space = Zap::Space.new(params[:space])
    @space.save
    respond_with(@space)
  end

  def edit
    @space = Zap::Space.find params[:id]
    respond_with @space
  end

  def update
    @space = Zap::Space.find(params[:id])
    @space.update_attributes(params[:space])
    respond_with(@space)
  end
end
