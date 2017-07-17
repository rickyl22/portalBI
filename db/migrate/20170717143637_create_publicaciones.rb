class CreatePublicaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :publicaciones do |t|
      t.text :titulo
      t.text :descripcion
      t.text :imagen
      t.text :estatus
      t.timestamps
    end
  end
end
