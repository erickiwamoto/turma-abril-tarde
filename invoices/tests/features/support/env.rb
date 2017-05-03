require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'faker'
require 'ostruct'
require_relative 'page_helper.rb'
require_relative 'helpers.rb'

World(Invoices::Pages)
World(Helpers)

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

Faker::Config.locale = 'pt-BR'

ENVIRONMENT_TYPE =  ENV['ENVIRONMENT_TYPE']
BROWSER = ENV['BROWSER']
DATA = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENVIRONMENT_TYPE}.yml")

Capybara.register_driver :selenium do |app|

    if BROWSER.eql?('chrome')
        Capybara::Selenium::Driver.new(app,
            :browser => :chrome,
            :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                'chromeOptions' => {
                    'args' => ['window-size=1440,900']
                }
            )
        )
    elsif BROWSER.eql?('firefox')
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)    
    end

end


Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = DATA['url']
end

Capybara.default_max_wait_time = 5
