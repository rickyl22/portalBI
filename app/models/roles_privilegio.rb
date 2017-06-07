class RolesPrivilegio < ApplicationRecord
  belongs_to :privilegio
  belongs_to :role
  has_many :permisos_asignado, :dependent => :destroy
end
