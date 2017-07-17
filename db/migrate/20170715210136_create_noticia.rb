class CreateNoticia < ActiveRecord::Migration[5.1]
  def change
    create_table :noticia do |t|
      t.text :imagen
      t.text :titulo
      t.text :descripcion
      t.timestamps
    end
  end
end
