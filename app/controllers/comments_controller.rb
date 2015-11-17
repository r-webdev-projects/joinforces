class CommentsController < ApplicationController
  before_filter :load_commentable
  before_filter :authenticate_user!, except: [:index]

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      response = [@commentable.comments.where(user_id: current_user.id).last]
      render json: response, notice: "Comment created."
    else
      render :new
    end
  end

  def destroy
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to idea_path(@idea), notice: 'Idea was successfully destroyed.'
  end

  def heart
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.find(params[:id])
    @user = current_user

    @comment.liked_by @user

    redirect_to idea_path(@idea)
  end

  def break_up
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.find(params[:id])
    @user = current_user

    @comment.unliked_by @user
    redirect_to idea_path(@idea)
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:body, :idea_id, :commentable_id, :parent_id)
  end

end
