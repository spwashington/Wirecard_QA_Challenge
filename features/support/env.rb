require 'httparty'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'https://conta-sandbox.wirecard.com.br/'
end

Capybara.default_max_wait_time = 10
Capybara.ignore_hidden_elements = false

@API_TOKEN = "RQNDUC8QLY2SBIOTDRUUCTZBHTUE58EA05FN8PTS"