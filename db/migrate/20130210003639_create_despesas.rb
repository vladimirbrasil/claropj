class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.string :numero
      t.string :tipo
      t.string :data
      t.string :hora
      t.string :origem
      t.string :numero_destino
      t.string :duracao
      t.string :tarifa
      t.string :valor
      t.string :valor_cobrado
      t.string :nome
      t.string :cc
      t.string :matricula
      t.string :descricao
      t.string :tipo_imposto

      t.timestamps
    end
  end
end
