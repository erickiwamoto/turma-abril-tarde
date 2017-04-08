

class Conta
  attr_accessor :nome, :saldo, :output, :operacao

  def initialize(nome)
    @nome = nome
    @saldo = 0
  end

  def valida_numerico(valor)
    if valor.is_a? Numeric
      true
    else
      false
    end
  end

  def deposita(valor)
    @operacao = 'Depósito'
    begin
      raise "Ops. Valor para #{operacao} deve ser numérico." if valida_numerico(valor) == false
      raise "Ops. Valor para #{operacao} não deve ser menor ou igual a 0." if valor <= 0
      raise "Ops. Valor para #{operacao} deve ser maior ou igual a R$100." if valor < 100
      self.saldo = saldo + valor
      @output = 'Tudo certo. Depósito realizado com sucesso. NinjaBank seu banco de sempre'
    rescue => exception
      @output = exception
    end
  end

  def saca(valor)
    @operacao = 'Saque'
    begin
      raise "Ops. Valor para #{operacao} deve númerico." if valida_numerico(valor) == false
      raise "Ops. Valor para #{operacao} deve ser maior ou igual a zero." if valor <= 0
      raise "Ops. Valor para #{operacao} deve ser maior ou igual a R$10" if valor < 10
      raise "Ops. Saldo insuficiente para #{operacao}." if valor > saldo
      @saldo -= valor
      @output = 'Tudo certo. Saque realizado com sucesso.'
    rescue => exception
      @output = exception
    end
  end

  def transfere(valor, conta)
    @operacao = 'Transferência'
    begin
      raise "Ops. Valor para #{operacao} deve númerico." if valida_numerico(valor) == false
      raise "Ops. Valor para #{operacao} deve ser maior ou igual a zero." if valor <= 0
      raise "Ops. Valor para #{operacao} deve ser maior ou igual a R$10" if valor < 10
      raise "Ops. Saldo insuficiente para #{operacao}." if valor > saldo
      saca(valor)
      conta.deposita(valor)
      @output = "Tudo certo. #{nome} transferiu R$ #{valor} para a conta de #{conta.nome}."
    rescue => exception
      @output = exception
    end
  end
end


