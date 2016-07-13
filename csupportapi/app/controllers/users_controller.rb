class UsersController < ApplicationController
  before_action :ember_params, only: [:update]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def ember_params
      if params[:data]
        params[:data][:attributes].delete("password")
        current_role = params[:data][:attributes]["role"]
        params[:data][:attributes].delete("role")
        current_role.nil? ? (roles_mask=1) : (roles_mask = User::ROLES_HASH[current_role.to_sym])
        params[:user] = params[:data][:attributes]
        params[:user][:roles_mask] = roles_mask
      end
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name)
    end
end
