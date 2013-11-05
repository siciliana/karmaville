class UsersController < ApplicationController
  def index
    @users = User.limit(1000).order("karma_sum DESC")
    # render 'omg'
  end
end
