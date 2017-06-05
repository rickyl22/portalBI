class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.datetime :fecha
      t.text :texto
      t.string :autor

      t.timestamps
    end
  end
end
