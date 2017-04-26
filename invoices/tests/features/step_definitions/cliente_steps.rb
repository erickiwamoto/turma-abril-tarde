#encoding:utf-8

Dado(/^login do usuário$/) do
    @home.load
    @home.login.click
    @login.with('kato.danzo@qaninja.com.br', 'secret')
end

Dado(/^acesso ao cadastro de clientes$/) do
  @nav.customer.click
  @customer.wait_for_view_title
  expect(@customer.view_title.text).to eql 'Clientes'
end

Dado(/^que eu tenho um cadastro de cliente$/) do
  @person = OpenStruct.new
  @person.name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"  
  @person.phone = Faker::PhoneNumber.cell_phone
  @person.email = Faker::Internet.free_email(@person.name)
  @person.notes = Faker::Lorem.paragraph
end

Dado(/^esse cliente tem o perfil "([^"]*)"$/) do |t|
  @person.type = t
end

Quando(/^faço o cadastro desse cliente$/) do
    @customer.save(@person)
end

Quando(/^faço o cadastro com qualquer tipo$/) do
    @customer.save_any_type(@person)
end

Então(/^vejo esse cliente cadastrado na lista$/) do
  @customer.search(@person.email)
  result = @customer.list[0].text
  expect(@customer.list.size).to eql 1
  expect(result).to include @person.name
  expect(result).to include @person.email
  expect(result).to include @person.phone
end

## Remove

Dado(/^eu tenho um cliente para exclusão$/) do
    steps %Q{
        Dado que eu tenho um cadastro de cliente
            E esse cliente tem o perfil "Gold"
        Quando faço o cadastro desse cliente
    }
    @email = @person.email
end

Quando(/^eu faço a exclusão de qualquer cliente$/) do
  line = @customer.list.sample
  @email = line.find('td:nth-child(3)').text;
#   puts @email = line.all('td')[2].text
  line.find('td span[class*=trash]').click
  @customer.confirm_delete.click
end

Quando(/^eu faço a exclusão de um cliente$/) do
  @customer.wait_for_list
  @customer.list.each do |line|
    if (line.text.include? @email)
        line.find('td span[class*=trash]').click
        @customer.confirm_delete.click
    end
  end
end

Então(/^esse cliente não é exibido na lista$/) do
  @customer.search(@email)
  result = @customer.alert.text
  expect(result).to eql "\"#{@email}\" não encontrado."
  sleep(5)
end

Quando(/^eu faço a exclusão de todos os clientes$/) do
  @customer.list.each do |line|
    line.find('td span[class*=trash]').click
    @customer.wait_for_confirm_delete
    @customer.confirm_delete.click
    sleep(1)
  end
end

Então(/^vejo a mensagem "([^"]*)"$/) do |message|
  expect(@customer.alert_info.text).to eql message
end