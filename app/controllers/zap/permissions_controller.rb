class Zap::PermissionsController < Zap::AdminController
  before_filter :load_source
  def new
    @permission = Permission.new_for(@source)
    respond_with @permission
  end

  def edit
    @permission = @source.permissions.find params[:id]
    respond_with @permission
  end

  def show
    redirect_to @source
  end

  def create
    @permission = @source.permissions.build(params[:permission])
    if @permission.save
      flash[:notice] = 'Permiso creado'
      redirect_to @source
    else
      render :action => 'new'
    end
  end

  def update
    @permission = @source.permissions.find(params[:id])
    @permission.update_attributes(params[:permission])
    @permission.save
    redirect_to @source
  end

  protected

  def load_source
    @source = User.find params[:user_id] if params[:user_id]
    @source = Space.find params[:space_id] if params[:space_id]
  end

end