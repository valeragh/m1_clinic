class AdminMailer < ActionMailer::Base
  default to: Proc.new { User.where("role = 'admin'").pluck(:email) },
          from: "1mensclinic@gmail.com"

  def letter_admin_confirmation(letter)
    @user = letter

    mail(subject: "Новое письмо")
  end

  def admin_conversation_user_doctor(message)
    @user = message

    mail(subject: "Пользователь #{message.conversation.sender.name}/#{message.conversation.sender.email} вопрос Доктору #{message.conversation.recipient.name}")
  end

  def admin_conversation_doctor_user(message)
    @user = message

    mail(subject: "Доктор #{message.conversation.recipient.name} пользователю #{message.conversation.sender.name}/#{message.conversation.sender.email}")
  end
end
