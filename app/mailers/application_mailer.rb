class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: ENV["mailer_user_name"]
end
