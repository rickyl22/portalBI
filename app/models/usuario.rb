class Usuario < ActiveRecord::Base
  attr_accessible :apellido, :area, :cargo, :codigo_empleado, :correo, :gerencia, :nombre, :supervisor, :telefono, :password_digest
end
