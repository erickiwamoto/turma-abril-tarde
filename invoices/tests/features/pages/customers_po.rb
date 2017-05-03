

module Invoices
    module Pages
        class CustomersPage < SitePrism::Page
            element :view_title, '#component-title'
            element :new_customer, '#dataview-insert-button'

            element :form, 'form'
            element :name_field, 'input[name=name]'
            element :phone_field, 'input[name=phone]'
            element :email_field, 'input[name=email]'
            element :type_dropdown, 'select[id=costumer]'
            element :notes_box, 'textarea[name=note]'
            element :save_button, '#form-submit-button'

            element :search_field, '#dataview-search-input'
            element :search_button, '#dataview-search-button'

            elements :list, '#dataview-table tbody tr'

            element :confirm_delete, 'button[data-bb-handler=success]'
            element :alert, '.alert-warning'
            element :alert_info, '.alert-info'

            def save(person)
                self.new_customer.click
                self.wait_for_form
                self.name_field.set person.name
                self.phone_field.set person.phone
                self.email_field.set person.email
                self.type_dropdown.find('option', text: person.type).select_option
                self.notes_box.set person.notes
                self.save_button.click
            end

            def save_any_type(person)
                self.new_customer.click

                type = self.type_dropdown.all('option').to_a
                type.delete_at 0
                t = type.sample.text

                self.wait_for_form
                self.name_field.set person.name
                self.phone_field.set person.phone
                self.email_field.set person.email
                self.type_dropdown.find('option', text: t).select_option
                self.notes_box.set person.notes
                self.save_button.click
            end

            def search(target)
                self.search_field.set target
                self.search_button.click
            end
        end
    end
end