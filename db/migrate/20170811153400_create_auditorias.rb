class CreateAuditorias < ActiveRecord::Migration[5.1]
  def change
    create_table :auditorias do |t|
      t.text :evento
      t.text :usuario
      t.text :rol
      t.text :modulo
      t.timestamps
    end
  end
end
