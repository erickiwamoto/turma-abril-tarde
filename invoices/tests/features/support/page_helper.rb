

Dir[File.join(File.dirname(__FILE__), '../pages/*_po.rb')].each { |file| require file }

module Invoices
    module Pages
        def home
            Invoices::Pages::HomePage.new
        end

        def login
            Invoices::Pages::LoginPage.new
        end

        def dash
            Invoices::Pages::DashboardPage.new
        end

        def customers
            Invoices::Pages::CustomersPage.new
        end
    end
end