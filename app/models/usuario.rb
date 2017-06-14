class Usuario < ApplicationRecord
  has_secure_password
  has_many :roles_privilegio
  has_many :permisos_asignado
  has_many :role, through: :roles_privilegio
  has_many :casos, dependent: :destroy
end
