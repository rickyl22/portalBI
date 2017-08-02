class CreateActivaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :activaciones do |t|
      t.date :fecha
      t.integer :cantidad
      t.string :plataforma

      t.timestamps
    end
  end
end
