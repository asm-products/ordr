require 'simplecov'
SimpleCov.start 'rails'
SimpleCov.command_name "MiniTest"

Rails.env ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride" #just for kicks

class ActiveSupport::TestCase
  
end

def sign_in

end
