# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_charset = "UTF-8"

ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => 'demoshop.name',
    :user_name => 'demoshop@gmail.com',
    :password => 'demoshop',
    :authentication => 'plain',
    :enable_starttls_auto => true
}


# Initialize the rails application
DemoShop::Application.initialize!

