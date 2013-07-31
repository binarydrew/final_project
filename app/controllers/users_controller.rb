class UsersController < ApplicationController

	def index
		@user = User.all
	end

	def new
		@user= User.new
	end

	  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to users_path    
      flash[:notice] = "User was successfully created"
    else
      flash[:alert] = "User could not be created."
      render :new
    end
  end

	def show
		@user=User.find(params[:id])
	end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:notice] = "User updated"
    else
      flash[:alert] = "Updating failed, please try again."
      render :new
    end
  end

  def edit
    @title = "Edit a User"
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
      flash[:notice] = "User is deleted."
    else
      flash[:notice] = "Cannot delete user, contact administrator."
      redirect_to users_path
    end
  end


private

def user_params
		params.require(:user).permit(:first_name, :last:name, :username, :password, :password_confirmation, :language_id)
end

end

