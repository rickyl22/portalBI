class Role < ApplicationRecord
  has_many :usuario
  has_many :roles_privilegio
  has_many :privilegio, through: :roles_privilegio
  validates :nombre, presence: true, uniqueness: true
end
