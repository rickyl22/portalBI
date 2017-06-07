class Role < ApplicationRecord
  has_many :roles_privilegio
  validates :nombre, presence: true, uniqueness: true
end
