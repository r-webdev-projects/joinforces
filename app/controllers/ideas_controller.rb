# this is a comment Josh is using to test Heroku Pipelines
class IdeasController < ApplicationController
  before_action :set_idea, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /ideas
  def index
    @ideas = Idea.all.order('created_at DESC')
  end

  # GET /ideas/1
  def show
    @commentable = @idea
    @comments = @commentable.comments.where(parent_id: nil)
    @comment = Comment.new
    @user = current_user
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      redirect_to idea_kickoff_path(@idea),  notice: 'Idea was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ideas/1
  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea.destroy
    redirect_to ideas_url, notice: 'Idea was successfully destroyed.'
  end

  def upvote
    @user = current_user
    @idea.liked_by @user

    redirect_to @idea
  end

  def downvote
    @user = current_user
    @idea.downvote_from @user

    redirect_to @idea
  end

  def kickoff
    @commentable = @idea
    @comments = @commentable.comments
    @comment = Comment.new

    # Check to see if the user is idea owner
    if @idea.user == current_user
      # If there are already comments, redirect to show page with notice
      if @comments.size < 1
        render :kickoff
      else
        redirect_to @idea, notice: 'People are already talking about your project. Contribute below.'
      end
    else
      redirect_to permission_denied_path, notice: 'You are not authorized to view this page.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id]) if params[:id].present?
      @idea = Idea.find(params[:idea_id]) if params[:id].blank? && params[:idea_id].present?
    end

    # Only allow a trusted parameter "white list" through.
    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
