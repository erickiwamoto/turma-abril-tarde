

module Invoices
    module Sections
        class NavbarSection < SitePrism::Section
            element :user_menu, '#menu-item-dropdown a[data-toggle=dropdown]'
            element :logout_link, 'a[href$=logout]'
            element :customer, 'a[href$=customers'

            def logout
                self.user_menu.click
                self.logout_link.click
            end
        end
    end
    module Pages
        class HomePage < SitePrism::Page
            set_url '/'
            element :login, '#login'
            section :nav, Invoices::Sections::NavbarSection, 'div[id=navbar]'
        end
    end
end
