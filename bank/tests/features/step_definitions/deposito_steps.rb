#encoding: utf-8

require_relative '../../../src/conta.rb'

# Pre-Condição

Dado(/^que o valor do depósito é de "([^"]*)"$/) do |valor|
    @valor_deposito = valor.to_i
end

Dado(/^que o valor do depósito inválido é de "([^"]*)"$/) do |valor|
  @valor_deposito = valor
end

# Ação

Quando(/^faço o depósito desse valor$/) do
  @joao = Conta.new('João')
  @joao.deposita(@valor_deposito)
end

# Resultado esperado

## Doc string
Então(/^vejo a mensagem:$/) do |mensagem|
  expect(@joao.output.to_s).to include mensagem
end
## Com parametro
Então(/^vejo a mensagem "([^"]*)"$/) do |mensagem|
  expect(@joao.output.to_s).to eq mensagem
end

Então(/^o saldo desse cliente deve ser de "([^"]*)"$/) do |saldo_final|
  expect(@joao.saldo).to eq saldo_final.to_i
end

## Valores em Lista

Quando(/^faço o deposito dessa lista$/) do
  # Arrays com Ruby
  # carros = ['Astra', 'Opala', 'Chevete', 'Passat', 'Fusca']
  # puts carros
  # carros.each do |carro|
  #   puts carro
  # end

  @carlton = Conta.new('Carlton')
  @msg_saida = []
  lista_valores = (1...100)
  lista_valores.each do |valor|
    @carlton.deposita(valor)
    @msg_saida.push(@carlton.output.to_s)
  end
end

Entao(/^vejo a mensagem na lista$/) do |mensagem|
  @msg_saida.each do |msg|
    expect(msg).to eq mensagem
  end
end