class Zap::CommentsController < Zap::AdminController
  before_filter :load_source
  
  def index
    @comments = @source.comments
  end
  
  def new
    @comment = Comment.new_for(@source)
    respond_with @comment
  end

  def edit
    @comment = @source.comments.find params[:id]
    respond_with @comment
  end

  def show
    redirect_to @source
  end

  def create
    @comment = @source.comments.build(params[:comment])
    @comment.space_id = @source.parent_id
    if @comment.save
      flash[:notice] = 'Comentario creado'
      redirect_to @source
    else
      render :action => 'new'
    end
  end

  def update
    @comment = @source.comments.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.save
    redirect_to @source
  end

  protected

  def load_source
    @source = User.find params[:user_id] if params[:user_id]
    @source = Space.find params[:space_id] if params[:space_id]
  end

end