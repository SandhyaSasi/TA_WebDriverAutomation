class MailinatorLoginPage < Capypage::Page
  set_url 'http://mailinator.com/index.jsp'
  element :inbox_field,'input#inboxfield'
  element :check_it, 'btn.btn-success'
end