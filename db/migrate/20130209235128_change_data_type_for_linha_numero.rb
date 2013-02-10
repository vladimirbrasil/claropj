class ChangeDataTypeForLinhaNumero < ActiveRecord::Migration
  def up
    change_table :linhas do |t|
      t.change :numero, :string
    end
  end

  def down
    change_table :linhas do |t|
      t.change :numero, :integer
    end
  end
end
