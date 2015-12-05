class UserMailer < ActionMailer::Base
  default from: "1mensclinic@gmail.com"

  def letter_confirmation(letter)
    @user = letter
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    attachments.inline['m1_clinic_team.jpg'] = File.read("#{Rails.root}/app/assets/images/m1_clinic_team.jpg")
    mail to: letter.email, subject: "Подтверждения отправки письма в Первую Мужскую Клинику"
  end

  def letter_admin_confirmation(letter)
    @user = letter
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    mail to: "1mensclinic@gmail.com", subject: "Новое письмо"
  end

  def user_send_confirmation(message)
    @user = message
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    attachments.inline['1m_clinic_doctor_ipad.jpg'] = File.read("#{Rails.root}/app/assets/images/1m_clinic_doctor_ipad.jpg")
    mail to: message.user.email, subject: "Подтверждения отправки вопроса доктору #{message.conversation.recipient.name} Первой Мужской Клиники"
  end

  def doctor_send_confirmation(message)
    @user = message
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    mail to: message.conversation.recipient.email, subject: "У Вас новый вопрос доктор #{message.conversation.recipient.name}"
  end

  def user_answer_confirmation(message)
    @user = message
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    attachments.inline['1m_clinic_doctor_ipad_2.jpg'] = File.read("#{Rails.root}/app/assets/images/1m_clinic_doctor_ipad_2.jpg")
    mail to: message.conversation.sender.email, subject: "Ответ на Ваш вопрос от доктора #{message.conversation.recipient.name} Первой Мужской Клиники"
  end

  def doctor_answer_confirmation(message)
    @user = message
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    mail to: message.conversation.recipient.email, subject: "Доктор #{message.conversation.recipient.name} Ваше письмо отправлено"
  end

  def user_send_certificate_confirmation(certificate)
    @user = certificate
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    attachments.inline['1m_clinic_doctor_ipad.jpg'] = File.read("#{Rails.root}/app/assets/images/1m_clinic_doctor_ipad.jpg")
    mail to: certificate.user.email, subject: "Подтверждения загрузки изображения для доктора #{certificate.conversation.recipient.name} Первой Мужской Клиники"
  end

  def doctor_send_certificate_confirmation(certificate)
    @user = certificate
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    mail to: certificate.conversation.recipient.email, subject: "У Вас новое изображение доктор #{certificate.conversation.recipient.name}"
  end

  def user_answer_certificate_confirmation(certificate)
    @user = certificate
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    attachments.inline['1m_clinic_doctor_ipad_2.jpg'] = File.read("#{Rails.root}/app/assets/images/1m_clinic_doctor_ipad_2.jpg")
    mail to: certificate.conversation.sender.email, subject: "Доктор #{certificate.conversation.recipient.name} Первой Мужской Клиники загрузил новое изображение"
  end

  def doctor_answer_certificate_confirmation(certificate)
    @user = certificate
    attachments.inline['1M_clinic_logo_small.png'] = File.read("#{Rails.root}/app/assets/images/1M_clinic_logo_small.png")
    mail to: certificate.conversation.recipient.email, subject: "Доктор #{message.conversation.recipient.name} Ваше изображение отправлено"
  end

end
