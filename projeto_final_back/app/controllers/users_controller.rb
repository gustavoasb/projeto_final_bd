class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    data = User.all.map do |user|
      {cpf: CPF.new(user.cpf).formatted, name: user.name, email: user.email, birth_date: user.birth_date, telephone_id: user.telephone_id}
    end
    render json: data, status: :ok
  end

  # GET /users/1
  def show
    data = {cpf: CPF.new(@user.cpf).formatted, name: @user.name, email: @user.email, birth_date: @user.birth_date.strftime("%d/%m/%Y"), telephone_id: @user.telephone_id}
    render json: data, status: :ok
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
      render json: @user, status: :ok
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

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:cpf, :name, :email, :birth_date, :telephone_id)
    end
end
