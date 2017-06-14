class Usuario < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :permisos_asignado
  #has_many :role, through: :roles_privilegio
  #has_many :casos


  def rol?(id)
    rol = Role.where("id = ?",id).first
    p "SUPUEWSTO ROL "+rol.inspect
    return rol

  end

  def admin?
    p "admin?"
    p "USUARIO ?"+usuario
    true if(current_user.role.alias == "admin")
  end

  def admin_min?
    p "USUARIO ?"+ usuario.inspect
    p "admin_min????????"
    true if(current_user.role.alias == "admin_min")
  end

  def admin_ind?
    p "USUARIO ?"+usuario
    p "admin_ind??"
    true if(current_user.role.alias == "admin_ind")
  end

  def cons_lid?
    p "cons_lid??"
    true if(current_user.role.alias == "cons_lid")
  end

  def cons?
    p "cons??"
    true if(current_user.role.alias == "cons")
  end

  def cli?
    p "cli??"
    true if(current_user.role.alias == "clis")
  end

end
