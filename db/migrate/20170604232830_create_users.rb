class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
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
      t.string :estatus
      t.string :password_digest

      t.timestamps
    end
  end
end
