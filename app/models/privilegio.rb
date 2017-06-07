class Privilegio < ApplicationRecord
  validates_presence_of :nombre, :message => 'El nombre del privilegio es requerido'
  has_many :roles_privilegio
end
