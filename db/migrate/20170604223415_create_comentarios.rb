class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.datetime :fecha
      t.text :texto
      t.string :autor
      t.integer :caso_id
      t.integer :role_id
      t.integer :leido_admin
      t.integer :leido_cons_lid
      t.integer :leido_cons
      t.belongs_to :caso

      t.timestamps
    end
  end
end
