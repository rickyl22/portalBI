class Usuario < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :permisos_asignado

  #validates :name,  presence: true, length: { maximum: 50 }

  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #validates :email, presence: true,
  #          format: { with: VALID_EMAIL_REGEX },
  #          uniqueness: { case_sensitive: false }
  #validates :password, length: { minimum: 6 }
  #has_many :role, through: :roles_privilegio

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
