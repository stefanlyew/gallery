# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mtsiran::Application.initialize!

Time::DATE_FORMATS[:post_time] = "%B %d, %Y at %I:%M %p"