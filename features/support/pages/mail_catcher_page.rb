class MailCatcherPage < Capypage::Page
  set_url 'http://127.0.0.1:1080/'
  elements :emails, '#messages', 'tbody tr'
  element :confirm_account, '.password_reset_link'


  def act_on_mail username
    #puts ($user_created_time)
    #time_created = $user_created_time.localtime
    #time_formatted = time_created.strftime("%A, %e %b %Y %l:%M:%S")
    #1.times do time_formatted.chop!
    #end
    #puts ("After")
    #puts (time_formatted)
    #emails.find_by_text(time_formatted).click
    emails.find_by_text(username).click
    Capybara.current_session.driver.browser.tap {|browser|browser.switch_to.frame(0)}
    token_page_url = page.find('.password_reset_link')[:href]
    visit token_page_url
  end

end