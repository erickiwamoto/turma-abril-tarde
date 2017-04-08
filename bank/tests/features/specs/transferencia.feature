#language: pt

@transf
Funcionalidade: Transferencia
    Sendo um cliente do banco
    Posso fazer transferências entre contas
    Para fins de pagamentos

    - valor nao pode ser menor ou zero
    - saldo do cliente deve ser positivo
    - valor dever se do tipo numérico

@smoke
Cenario: Transferência entre contas
  
  Dado que eu tenho a conta Origem
      | saldo | 1000 | 
      | valor | 100  | 
    E eu tenho a conta Destino
      | saldo | 500 | 
  Quando faço a Transferência desse valor
  Então vejo a mensagem de trasferencia
  """
  Tudo certo. ORIGEM transferiu R$ VALOR para a conta de DESTINO.
  """
    E o saldo desses contas deve ser atualizado
        | Origem  | 900 | 
        | Destino | 600 | 