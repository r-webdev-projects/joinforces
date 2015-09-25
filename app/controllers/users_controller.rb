class UsersController < ApplicationController

  # only allow currently logged in user to edit/update their own profile
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

  def index
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to @user
      flash[:notice] = "Profile updated."
  	else
      # need to update message to specify what is wrong with form
      flash[:danger] = "Please correctly fill out the form."
  		render 'edit'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:email, :first_name, :last_name, :location, 
  																 :password, :password_confirmation)
  	end

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end
