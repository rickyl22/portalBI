class CreatePermisosAsignados < ActiveRecord::Migration[5.1]
  def change
    create_table :permisos_asignados do |t|
      t.belongs_to :privilegio, index: true
      t.belongs_to :role, index: true
      t.belongs_to :usuario, index: true
      t.integer :recurso #ID del objeto sobre el cual se tiene permisos asignados

      t.timestamps
    end
  end
end
