#encoding: utf-8

require_relative '../../../src/conta.rb'

Dado(/^que eu tenho a conta Origem$/) do |table|
  @saldo_joao = table.rows_hash['saldo'].to_i
  @valor_transferencia = table.rows_hash['valor'].to_i
  @joao = Conta.new('João')
  @joao.deposita(@saldo_joao)
end

Dado(/^eu tenho a conta Destino$/) do |table|
  @saldo_maria = table.rows_hash['saldo'].to_i
  @maria = Conta.new('Maria')
  @maria.deposita(@saldo_maria)
end

Quando(/^faço a Transferência desse valor$/) do
  @joao.transfere(@valor_transferencia, @maria)
end

Então(/^vejo a mensagem de trasferencia$/) do |mensagem|
  mensagem = mensagem.gsub('ORIGEM', @joao.nome)
  mensagem = mensagem.gsub('VALOR', @valor_transferencia.to_s)
  mensagem = mensagem.gsub('DESTINO', @maria.nome)
  expect(@joao.output.to_s).to eq mensagem
end

Então(/^o saldo desses contas deve ser atualizado$/) do |table|
  saldo_final_joao = table.rows_hash['Origem'].to_i
  saldo_final_maria = table.rows_hash['Destino'].to_i
  expect(@joao.saldo).to eq saldo_final_joao
  expect(@maria.saldo).to eq saldo_final_maria
end