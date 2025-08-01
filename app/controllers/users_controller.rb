class UsersController < ApplicationController
    skip_before_action :require_login, only: %i[new create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = 'ユーザー登録が完了しました。'
            redirect_to login_path
        else
            flash.now[:danger] = 'ユーザー登録に失敗しました。'
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
