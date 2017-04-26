require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'faker'
require 'ostruct'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

Faker::Config.locale = 'pt-BR'

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 5
