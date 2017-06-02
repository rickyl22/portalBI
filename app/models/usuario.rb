class Usuario < ActiveRecord::Base
  has_secure_password
  attr_accessible :apellido, :area, :cargo, :codigo_empleado, :correo, :gerencia, :nombre, :supervisor, :telefono, :password_digest, :password, :password_confirmation, :usuario, :justificacion, :estatus
end
