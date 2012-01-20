class UsersController < ApplicationController
  def new
    @title = "User Sign-up"
  end
  
  def show
    @user = User.find(params[:id])    
  end    

end
