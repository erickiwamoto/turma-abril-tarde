#language: pt

Funcionalidade: Depósito
    Sendo um cliente do banco
    Posso fazer depósitos na minha conta corrente
    Para que eu possa ter um controle financeiro, consultar meu saldo, extrato e tambem fazer pagamentos e tranferências

@smoke @feliz
Cenário: Depósito com sucesso

    Dado que o valor do depósito é de "100"
    Quando faço o depósito desse valor
    Então vejo a mensagem:
    """
    Tudo certo. Depósito realizado com sucesso.
    """
        E o saldo desse cliente deve ser de "100"

Cenário: Valor diferente de numérico

    Dado que o valor do depósito inválido é de "xp"
    Quando faço o depósito desse valor
    Então vejo a mensagem:
    """
    Ops. Valor para Depósito deve ser numérico.
    """
        E o saldo desse cliente deve ser de "0"

@inv
Esquema do Cenario: Validar valores
  
  Dado que o valor do depósito é de <valor>
  Quando faço o depósito desse valor
  Então vejo a mensagem <mensagem>
  E o saldo desse cliente deve ser de <saldo_final>
  
  Exemplos:
      | valor | mensagem                                                    | saldo_final | 
      | "0"   | "Ops. Valor para Depósito não deve ser menor ou igual a 0." | "0"         | 
      | "-1"  | "Ops. Valor para Depósito não deve ser menor ou igual a 0." | "0"         | 
      | "99"  | "Ops. Valor para Depósito deve ser maior ou igual a R$100." | "0"         |
      | "20"  | "Ops. Valor para Depósito deve ser maior ou igual a R$100." | "0"         |  

@lista
Cenario: Lista de valores menores que 100

    Quando faço o deposito dessa lista
    Entao vejo a mensagem na lista
    """
    Ops. Valor para Depósito deve ser maior ou igual a R$100.
    """
