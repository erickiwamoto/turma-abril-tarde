#language: pt

@doing
Funcionalidade: Excluir cliente
    Sendo um administrador do Invoices
    Posso remover um cliente já cadastrado

Cenario: Usuario acessa o sistema
    * login do usuário
    * acesso ao cadastro de clientes

Cenario: Remover qualquer cliente

    Quando eu faço a exclusão de qualquer cliente
    Então esse cliente não é exibido na lista

Cenario: Remover um registro específico

    Dado eu tenho um cliente para exclusão
    Quando eu faço a exclusão de um cliente
    Então esse cliente não é exibido na lista

Cenario: Remover todos clientes

    Quando eu faço a exclusão de todos os clientes
    Então vejo a mensagem "Nenhum cliente cadastrado :("