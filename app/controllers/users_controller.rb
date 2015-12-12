class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render_json(@users)
  end

  def show
    render_json(@user)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render_json(@user, :created)
    else
      render_json(@user.errors, :unprocessable_entity)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      head :no_content
    else
      render_json(@user.errors, :unprocessable_entity)
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :phone_number, :verified)
    end
end
