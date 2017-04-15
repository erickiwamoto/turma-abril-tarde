
class HomePage < SitePrism::Page
    set_url '/'
    element :login, '#login'
end

class NavbarPage < SitePrism::Page
    element :user_menu, '#menu-item-dropdown a[data-toggle=dropdown]'
    element :logout_link, 'a[href$=logout]'

    def logout
        self.user_menu.click
        self.logout_link.click
    end
end

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

class DashboardPage < SitePrism::Page
    element :title, '#content #page_title'
end