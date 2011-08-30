# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => 'your.host.name',
    :user_name => ' @gmail.com',
    :password => ' ',
    :authentication => 'plain',
    :enable_starttls_auto => true
}


# Initialize the rails application
DemoShop::Application.initialize!
