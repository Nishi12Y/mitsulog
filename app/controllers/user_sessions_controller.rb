class UserSessionsController < ApplicationController
    skip_before_action :require_login, only: %i[new create]

    def new; end

    def create
        if user = login(params[:email], params[:password])
            redirect_back_or_to root_path, success: 'ログインしました。'
        else
            flash.now[:danger] = 'メールアドレスまたはパスワードが正しくありません。'
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        logout
        redirect_to root_path, status: :see_other, success: 'ログアウトしました。'
    end
end
