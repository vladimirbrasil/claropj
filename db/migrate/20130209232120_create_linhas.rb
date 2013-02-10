class CreateLinhas < ActiveRecord::Migration
  def change
    create_table :linhas do |t|
      t.integer :numero
      t.string :proprietario

      t.timestamps
    end
  end
end
