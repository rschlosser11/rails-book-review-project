class UsersController < ApplicationController
 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user)
   else
     render :new
   end
 end

 def show
   @user = User.find(params[:id])
 end

 def edit
   if helpers.current_user.id == params[:id].to_i
     @user = helpers.current_user
   else
     redirect_to user_path(params[:id]), flash: {warning: "You can only edit your own profile"}
   end
 end

 def update
   if helpers.current_user.id == params[:id].to_i
     @user = helpers.current_user
     @user.update(user_params)
     redirect_to user_path(@user)
   else
     redirect_to user_path(params[:id]), flash: {warning: "You can only edit your own profile"}
   end
 end

 def destroy
   session.delete(:user_id)
   redirect_to root_path
 end

 private

 def user_params
   params.require(:user).permit(:name, :email, :password, :reviewer, :bio)
 end
end
