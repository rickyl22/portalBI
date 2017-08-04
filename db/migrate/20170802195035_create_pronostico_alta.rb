class CreatePronosticoAlta < ActiveRecord::Migration[5.1]
  def change
    create_table :pronostico_alta do |t|
      t.date :fecha
      t.integer :cantidad
      t.string :plataforma

      t.timestamps
    end
  end
end
