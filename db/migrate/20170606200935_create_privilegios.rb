class CreatePrivilegios < ActiveRecord::Migration[5.1]
  def change
    create_table :privilegios do |t|
      t.string :nombre
      t.string :descripcion
      t.string :modulo
      t.timestamps
    end
  end
end
