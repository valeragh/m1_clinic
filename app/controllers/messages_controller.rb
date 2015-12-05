class MessagesController < ApplicationController
	before_filter :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
    if current_user.role != 'doctor'
      UserMailer.delay.user_send_confirmation(@message)
      UserMailer.delay.doctor_send_confirmation(@message)
      AdminMailer.delay.admin_conversation_user_doctor(@message)
    else
      UserMailer.delay.user_answer_confirmation(@message)
      UserMailer.delay.doctor_answer_confirmation(@message)
      AdminMailer.delay.admin_conversation_doctor_user(@message)
    end

    @path = conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
