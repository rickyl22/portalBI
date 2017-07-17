class CreateProyectos < ActiveRecord::Migration[5.1]
  def change
    create_table :proyectos do |t|
      t.text :imagen
      t.text :titulo
      t.text :descripcion
      t.text :area

      t.timestamps
    end
  end
end
