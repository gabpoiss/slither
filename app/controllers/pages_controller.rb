class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def show
    if current_user.id == params[:user_id].to_i
      my_profile
    else
      user_profile
    end
  end

  def my_profile
    @user = current_user
    render :my_profile
  end

  def user_profile
    @user = User.find(params[:user_id])
    render :user_profile
  end
end
