class UserMailer < ActionMailer::Base
  default from: "1mensclinic@gmail.com"

  def letter_confirmation(letter)
    @user = letter

    mail to: letter.email, subject: "Подтверждения отправки письма в Первую Мужскую Клинику"
  end

  def letter_admin_confirmation(letter)
    @user = letter

    mail to: "1mensclinic@gmail.com", subject: "Новое письмо"
  end

  def user_send_confirmation(message)
    @user = message

    mail to: message.user.email, subject: "Подтверждения отправки вопроса доктору #{message.conversation.recipient.name} Первой Мужской Клиники"
  end

  def doctor_send_confirmation(message)
    @user = message

    mail to: message.conversation.recipient.email, subject: "У Вас новый вопрос доктор #{message.conversation.recipient.name}"
  end

  def user_answer_confirmation(message)
    @user = message

    mail to: message.conversation.sender.email, subject: "Ответ на Ваш вопрос от доктора #{message.conversation.recipient.name} Первой Мужской Клиники"
  end

  def doctor_answer_confirmation(message)
    @user = message

    mail to: message.conversation.recipient.email, subject: "Доктор #{message.conversation.recipient.name} Ваше письмо отправлено"
  end

end
