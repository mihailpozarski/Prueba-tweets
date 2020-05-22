class FriendsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @friend = Friend.find_by(user: current_user, friend: user)
    if @friend
      @friend.destroy
    else
      current_user.friends.create(friend: user)
    end
    redirect_to user_path user
  end

  def update
  end

  def destroy
  end

  private

  def user
    @user ||= User.find(params.require(:user_id))
  end
end
