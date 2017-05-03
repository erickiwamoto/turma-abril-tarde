

module Invoices
    module Pages
        class LoginPage < SitePrism::Page
            set_url '/login'
            element :form, '#login_form'
            element :username, '#email'
            element :password, 'input[type=password]'
            element :sign_in, '.login-button'
            element :warning_message, 'div[class*=alert-warning]'

            def with(u, p)
                self.username.set ''
                self.username.set u
                self.password.set ''
                self.password.set p
                self.sign_in.click
            end
        end
    end
end