#encoding: utf-8

Dado(/^que eu tenho um cadastro$/) do
  #@nome = Faker::Name.first_name + ' ' + Faker::Name.last_name
  @nome = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  @cpf = DocumentosBr.cpf
  @email = Faker::Internet.free_email(@nome)
end

Quando(/^faço a abertura dessa conta$/) do
  puts @nome
  puts @cpf
  puts @email
end

Entao(/^vejo a mensagem de abertura de conta "([^"]*)"$/) do |arg1|
  conta = ['00000000011', '00000000012']
  puts conta
end