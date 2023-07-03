module Users
  class UsersController < ApplicationController
    before_action :set_user, only: :show

    def show
      render json: @user, status: 200 if @user
    end

    def create
      form = RegistrationForm.new params

      if form.save
        session[:user_id] = form.user.id
        render json: form.user, status: 200
      else
        render json: form.user.errors.full_messages, status: 502
      end
    end

    def change_password
      form = PasswordForm.new current_user, params

      if form.save
        render json: true, status: 200
      else
        render json: form.errors.full_messages, status: 502
      end
    end

    def login
      user = User.find_by(email: params[:username]) || User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: 200
      else
        render json: false, status: 401
      end
    end

    def logout
      session[:user_id] = nil

      render json: true, status: 200
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
