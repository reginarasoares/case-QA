require "capybara"
require "capybara/rspec/matchers"
require "capybara/dsl"
require "selenium-webdriver"

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

Capybara.configure do |config|
    #selenium     selenium_chrome    selenium_chrome_healess
    config.default_driver = :selenium_chrome
    config.app_host = 'https://www.saraiva.com.br'
    config.default_max_wait_time = 30
end