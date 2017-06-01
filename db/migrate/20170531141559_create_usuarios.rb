class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :codigo_empleado
      t.string :area
      t.string :gerencia
      t.string :cargo
      t.string :correo
      t.string :telefono
      t.string :nombre
      t.string :apellido
      t.string :supervisor
      t.string :password_digest

      t.timestamps
    end
  end
end
