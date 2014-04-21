require 'bundler'
require 'timecop'

Bundler.require

require_relative 'page_helper'

World(PageHelper)

Capybara.default_driver = :selenium

class UserDB < ActiveRecord::Base
  self.abstract_class = true

  establish_connection :adapter => 'postgresql',
                       :database => 'user_management_test',
                       :username => 'user_management_test'
end
