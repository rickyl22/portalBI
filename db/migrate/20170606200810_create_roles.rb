class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :alias
      t.string :descripcion
      t.string :nombre

      t.timestamps :null => false
    end
  end
end
