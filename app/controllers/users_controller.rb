class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def index
        @users = User.all

        render json: @users
    end

    def show
        @user = User.find(params[:id])

        render json: @user
    end

    def create
        encrypted_password = BCrypt::Password.create(params[:password])
        @user = User.create(
            username: params[:username],
            name: params[:name],
            location: params[:location],
            password_digest: encrypted_password
        )

        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { error: 'Failed to create user' },
                status: :not_acceptable
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        render status: 204
    end

    def update
        @user = User.find(params[:id])
        @user.update(params[:user])

        render json: @user
    end

    private

    # def users_params
    #     params.require(:user).permit(:username, :name, :password)
    # end
end
