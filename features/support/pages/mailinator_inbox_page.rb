class MailinatorInboxPage < Capypage::Page
  element :inbox_header, 'h2#InboxNameCtrl'
  elements :emails, 'ul#mailcontainer', 'li.message div.subject'
  element :confirm_account, 'a.password_reset_link'

  def act_on_mail subject
    retries = 0
    while !emails.find_by_text(subject).present? and retries < 60
      load
      retries = retries + 1
    end
    emails.find_by_text(subject).click
    confirm_account.click
  end
end