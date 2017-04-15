#encoding: utf-8

Quando(/^acesso a pagina de Login$/) do
  @home.load
  @home.login.click
end

Então(/^vejo a página de login$/) do
  expect(@login).to have_form # verifica se o elemento existe
  @login.wait_for_form
  expect(@login.form.text).to include 'Faça seu login'
end

Dado(/^que eu tenho o "([^"]*)" e a "([^"]*)"$/) do |user, pwd|
  @user = user
  @password = pwd
end

Dado(/^que eu tenho uma lista de usuários: (\d+)$/) do |index, table|
  @user = table.hashes[index.to_i]['Usuario']
  @password = table.hashes[index.to_i]['Senha']
end

Dado(/^que eu tenho um usuário:$/) do |table|
  @user = table.rows_hash['Usuario']
  @password = table.rows_hash['Senha']
end

Quando(/^faço login$/) do
  @login.with(@user, @password)
end

Então(/^vejo o Dashboard com a mensagem "([^"]*)"$/) do |message|
  #expect(page).to have_content message
  expect(@dash.title.text).to eq message
end

Então(/^vejo o email do usuário no menu superior$/) do
  expect(@nav.user_menu.text).to eq @user
end

Então(/^vejo a mensagem de alerta "([^"]*)"$/) do |message|
  expect(@login.warning_message.text).to include message
end