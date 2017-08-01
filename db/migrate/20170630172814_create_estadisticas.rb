class CreateEstadisticas < ActiveRecord::Migration[5.1]
  def change
    create_table :estadisticas do |t|
      t.text :descripcion
      t.date :fecha_desde
      t.date :fecha_hasta
      t.integer :cantidad

      t.timestamps
    end
  end
end
