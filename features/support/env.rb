require 'httparty'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'json'

################### SELENIUM/CAPYBARA SETUP ###################
Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'https://conta-sandbox.wirecard.com.br'
end

Capybara.default_max_wait_time = 10
Capybara.ignore_hidden_elements = false


################### API SETUP ###################
$API_PaymentOrder_URL = "https://sandbox.moip.com.br/v2/orders/"

$API_AUTH = {
	:username => 'ADD_API_TOKEN', 
  :password => 'ADD_API_KEY'
}

$API_HEADER = { 
  "content-type" => 'application/json'
}