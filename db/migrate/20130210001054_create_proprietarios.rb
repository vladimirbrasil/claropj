class CreateProprietarios < ActiveRecord::Migration
  def change
    create_table :proprietarios do |t|
      t.string :nome
      t.string :email
      t.text :obs

      t.timestamps
    end
  end
end
