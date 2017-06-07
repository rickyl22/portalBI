class CreateRolesPrivilegios < ActiveRecord::Migration[5.1]
  def change
    create_table :roles_privilegios do |t|
      t.belongs_to :privilegio, index: true
      t.belongs_to :role, index: true
      t.integer :alcance

      t.timestamps
    end
  end
end
