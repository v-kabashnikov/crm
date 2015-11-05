class UserMailer < ApplicationMailer
  layout 'mailer'
  def admin(team)
    @team = team
    mail(to: ENV['admin_notifications_email'], subject: "Новая команда на mozgva.ru")
  end
end
