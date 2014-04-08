DatabaseCleaner.add_cleaner(:active_record,:connection => UserDB).strategy = :truncation

Before do |_|
  DatabaseCleaner.clean
end

After do |scenario|
  $dirty_ui = true
  if scenario.failed?
    screenshot_name = screenshot_name(scenario)
    save_screenshot screenshot_name
    embed screenshot_name, 'image/png', 'Screenshot'
    if ENV['PAUSE']
      p 'Press enter to continue'
      Readline.readline
    end
  end
end

def screenshot_name(scenario, extension = '.png')
  scenario_line = scenario.backtrace_line.split(':in').first.split('/').last.gsub('.', '_').gsub(':', '_line_')
  scenario_line + '_time_' + Time.now.strftime('%Y-%m-%d_%H-%M-%S') + extension
end

def save_screenshot(file_name)
  Capybara.current_session.driver.save_screenshot 'features/output/' + file_name
end