class UsersController < ApplicationController
  def show
    user = User.find_by(email: params[:id])
    if user
       render json: user
    else
       raise 'No User'
    end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: user
      else
      render json: {errors: user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :name, :profile_pic)
  end
end
