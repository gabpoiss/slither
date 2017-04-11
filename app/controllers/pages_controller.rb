class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def show
    if current_user.id == params[:user_id]
      my_profile
    else
      user_profile
    end
  end

  def my_profile
    render :my_profile
  end

  def user_profile
    render :user_profile
  end
end
