#language: pt

Funcionalidade: Login
  Sendo um usuário do Invoices
  Posso fazer login no sistema
  Para que eu possa cadastrar meus clientes e lançar faturas
  
Cenario: Acessa pagina de login
  Quando acesso a pagina de Login
  Então vejo a página de login

@logout @smoke
Cenario: Login com sucesso
  
  Dado que eu tenho um usuário:
      | Usuario | kato.danzo@qaninja.com.br | 
      | Senha   | secret                    | 
  Quando faço login
  Então vejo o Dashboard com a mensagem "Bem Vindo Kato Danzo!"
    E vejo o email do usuário no menu superior

@inv
Esquema do Cenário: Login sem sucesso
  
  Dado que eu tenho o <usuario> e a <senha>
  Quando faço login
  Então vejo a mensagem de alerta <mensagem>
  
  Exemplos:
      | usuario                     | senha    | mensagem                            | 
      | "kato.danzo@qaninja.com.br" | "abc123" | "Incorrect password"                | 
      | "kato.danzo@qaninja.net"    | "secret" | "User not found"                    | 
      | "kato.dando*qaninja.com.br" | "secret" | "Please enter your e-mail address." | 

@hybrid
Esquema do Cenário: Login com data table
  Dado que eu tenho uma lista de usuários: <indice>
      | Usuario                   | Senha  | 
      | kato.danzo@qaninja.com.br | abc123 | 
      | kato.danzo@qaninja.net    | secret | 
      | kato.danzo*qaninja.com    | secret | 
  Quando faço login
  Entao vejo a mensagem de alerta <mensagem>
  
  Exemplos:
      | indice | mensagem                            | 
      | 0      | "Incorrect password"                | 
      | 1      | "User not found"                    | 
      | 2      | "Please enter your e-mail address." | 


  