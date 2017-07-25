class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :codigo_empleado
      t.string :area
      t.string :gerencia
      t.string :cargo
      t.string :correo
      t.string :telefono
      t.string :nombre
      t.string :apellido
      t.string :supervisor
      t.string :justificacion
      t.boolean :estatus
      t.string :password_digest
      t.integer :role_id

      t.timestamps
    end
  end
end
