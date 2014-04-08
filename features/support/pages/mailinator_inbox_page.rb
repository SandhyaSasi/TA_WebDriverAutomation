class MailinatorInboxPage < Capypage::Page
  element :inbox_header, 'h2#InboxNameCtrl'
  elements :emails, 'ul#mailcontainer', 'li.message div.subject'
  element :confirm_account, 'a.password_reset_link'

  def confirm_user
    emails.find_by_text('Confirmation instructions').click
    confirm_account.click
  end

  def reset_password
    emails.find_by_text('Reset password instructions').click
    confirm_account.click
  end
end