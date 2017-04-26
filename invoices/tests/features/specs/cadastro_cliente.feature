#language:pt

Funcionalidade: Cadastro de cliente
    Sendo um usuário do Invoices
    Posso cadastrar um novo cliente
    Para lançar faturas, cobranças e administra-los

Cenario: Usuario acessa o sistema
    * login do usuário
    * acesso ao cadastro de clientes

Esquema do Cenario: Cadastrar novo Cliente
  
  Dado que eu tenho um cadastro de cliente
    E esse cliente tem o perfil <tipo>
  Quando faço o cadastro desse cliente
  Então vejo esse cliente cadastrado na lista
  
  Exemplos:
      | tipo        | 
      | "Prime"     | 
      | "Gold"      | 
      | "Exclusivo" | 
      | "Platinum"  | 

Cenario: Cadastrar com qualquer tipo

  Dado que eu tenho um cadastro de cliente
  Quando faço o cadastro com qualquer tipo
  Então vejo esse cliente cadastrado na lista