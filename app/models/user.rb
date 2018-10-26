class User < ApplicationRecord
  has_secure_password
  validates :user_name, :uniqueness: {case_sensitive: false}

  def create
    @user = User.find_or_create_by(params[:user_name])
    if @user.valid?
      render json: { user: UserSerializer.new(@user)}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors , status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password, :bio, :avatar)
  end

end
