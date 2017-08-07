class Usuario < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :permisos_asignado
  has_many :casos, dependent: :destroy


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

end
