class CreatePronosticoRecargas < ActiveRecord::Migration[5.1]
  def change
    create_table :pronostico_recargas do |t|
      t.date :fecha
      t.integer :cantidad

      t.timestamps
    end
  end
end
