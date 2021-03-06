module Api::V1
  class UsersController < ApiController
    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit([:email, :password])
    end
  end

end
