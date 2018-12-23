class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    current_user.update(user_params)
    render json: { token: token, user: UserSerializer.new(current_user, avatar_url: url_for(current_user.avatar)) }, status: :ok
  end

  private

  def user_params
    params.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
