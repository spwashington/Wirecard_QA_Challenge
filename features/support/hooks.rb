require 'report_builder'
   
at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'features/log/report_result.json'
    config.report_path = 'features/log/report_result'
    config.report_title = "Result of test Wirecard Sandbox"
    config.additional_info = {API_Url: ENV['API']}
    config.color = 'blue'
  end
  ReportBuilder.build_report
end

After do |scenario|
    filename = scenario.name.tr(' ', '_').downcase! 
    filename = filename.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    screenshot = "features/log/screenshot/#{filename}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'show screenshot')
end