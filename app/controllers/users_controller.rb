class UsersController < ApplicationController
  def show
    @user = User.find(params.require(:id))
  end
end
