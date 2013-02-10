class Despesa < ActiveRecord::Base
  attr_accessible :cc, :data, :descricao, :duracao, :hora, :matricula, :nome, :numero, :numero_destino, :origem, :tarifa, :tipo, :tipo_imposto, :valor, :valor_cobrado
end
