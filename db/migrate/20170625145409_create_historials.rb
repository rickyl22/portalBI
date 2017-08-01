class CreateHistorials < ActiveRecord::Migration[5.1]
  def change
    create_table :historials do |t|
      t.string :evento
      t.datetime :fecha
      t.integer :usuario_id
      t.string :estatus
      t.belongs_to :caso, foreign_key: true

      t.timestamps
    end
  end
end
