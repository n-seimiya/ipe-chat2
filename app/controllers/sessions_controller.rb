class SessionsController < ApplicationController
    skip_before_action :login_required
    
    def new
    end

    def login
        user = User.find_by(email: login_params[:email])
        if user&.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'ログインしました'
        else
            redirect_to login_path, notice: 'ログインに失敗しました'
        end
    end

    def signup
    end

    def create
        user = User.new(create_params)
        if user.save
            session[:user_id] = user.id
            redirect_to root_path, notice: '登録しました'
        else
            redirect_to root_path, notice: '登録に失敗しました'
        end
    end

    def logout
        reset_session
        redirect_to root_path, notice: 'ログアウトしました'
    end

    private

        def login_params
            params.require(:session).permit(:email, :password)
        end

        def create_params
            params.require(:session).permit(:name, :email, :password, :password_confirmation)
        end
end
