class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # POST /messages
  def create
    @message = current_user.messages.create(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :chat_id, :chat_type)
  end
end
