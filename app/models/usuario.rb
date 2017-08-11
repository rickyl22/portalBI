class Usuario < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :permisos_asignado
  has_many :casos, dependent: :destroy
  #validates :correo, uniqueness: {mesaje: "Correo ya registrado en el sistema"},
  #          presence: {mesaje:"Debe indicar un correo"},
  #          format: { with: /\b[A-Z0-9._%a-z\-]+@telefonica\.com\z/, message: "Debe utilizar un correo con dominio @telefonica.com" }
  #validates :usuario, uniqueness: {mesaje: "Nombre de usuario ya registrado en el sistema"}, presence: {mesaje:"Debe indicar un nombre de usuario"}, length: {  in: 4..8, mesaje:"El nombre de usuario debe poseer un mínimo de 4 caracteres y máximo de 8 " }
  #validates :codigo_empleado, uniqueness: {mesaje: "Código de empleado de usuario ya registrado en el sistema"}, presence: {mesaje:"Debe indicar el código de empleado"}, length: { is: 6, mesaje:"El código de empleado debe tener 6 caracteres: EXXXXX" }

  def rol?(id)
    rol = Role.where("id = ?",id).first
    return rol

  end

  def admin?
    
    true if(current_user.role.alias == "admin")
  end

  def admin_min?
    
    true if(current_user.role.alias == "admin_min")
  end

  def admin_ind?
    
    true if(current_user.role.alias == "admin_ind")
  end

  def cons_lid?
    
    true if(current_user.role.alias == "cons_lid")
  end

  def cons?
    
    true if(current_user.role.alias == "cons")
  end

  def cli?
    
    true if(current_user.role.alias == "clis")
  end

  def cli_ind?
    true if(current_user.role.alias == "cli_ind")
  end


end
