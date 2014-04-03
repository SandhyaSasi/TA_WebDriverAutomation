class MailinatorInboxPage < Capypage::Page
  element :inbox_header, 'h2#InboxNameCtrl'
  elements :emails, 'ul#mailcontainer', 'li.message div.subject'
  element :confirm_account, 'a.password_reset_link'
end