class MessagesController < ApplicationController

    def index
        @messages = Message.includes(:user).all
        @message = Message.new
    end

    def create
        @message = Message.new(create_params)
        if @message.save
            respond_to do |format|
                format.html { redirect_to root_path, notice: 'メッセージを送信しました' }
                format.json
            end
        else
            redirect_to root_path, notice: 'メッセージの送信に失敗しました'
        end
    end

    def edit
        @message = Message.find(params[:id])
        unless @message.user_id == current_user.id
            redirect_to root_path, notice: '不正なアクセスです'
        end
    end

    def update
        @message = Message.find(params[:id])
        if @message.user_id == current_user.id && @message.update(update_params)
            redirect_to root_path, notice: 'メッセージを変更しました'
        else
            redirect_to root_path, notice: 'メッセージの変更に失敗しました'
        end
    end

    def destroy
        @message = Message.find(params[:id])
        if @message.user_id == current_user.id && @message.destroy
            redirect_to root_path, notice: 'メッセージを削除しました'
        else
            redirect_to root_path, notice: 'メッセージの削除に失敗しました'
        end
    end

    private

        def create_params
            params.require(:message).permit(:content).merge(user_id: current_user.id)
        end

        def update_params
            params.require(:message).permit(:content).merge(user_id: current_user.id)
        end
end