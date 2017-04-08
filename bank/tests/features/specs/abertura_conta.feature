#language: pt

Funcionalidade: Abertura de Contas
  Sendo um potecial cliente
  Posso solicitar um abertura de conta
  Para usufruir dos beneficios do banco

@new
Cenario: Abertura de conta corrente
  
  Dado que eu tenho um cadastro
  Quando faço a abertura dessa conta
  Entao vejo a mensagem de abertura de conta "Aguarda sua solicitação está em analise"