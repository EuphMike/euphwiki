ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  'app72460031@heroku.com',
  :password             =>  'zdjcbnlc3013',
  :domain               =>  'http://euphwiki.herokuapp.com',
  :enable_starttls_auto  =>  true
}