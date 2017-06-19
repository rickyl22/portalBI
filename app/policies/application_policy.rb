class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def rol
    @user.role.alias
  end
  def admin?
    true if(@user.role.alias == "admin")
  end

  def admin_min?
    true if(@user.role.alias == "admin_min")
  end

  def admin_ind?
    true if(@user.role.alias == "admin_ind")
  end

  def cons_lid?
    true if(@user.role.alias == "cons_lid")
  end

  def cons?
    true if(@user.role.alias == "cons")
  end

  def cli?
    true if(@user.role.alias == "cli")
  end

  def modulo
    @user.role.privilegio.modulo
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    def admin?
      true if(@user.role.alias == "admin")
    end

    def admin_min?
      true if(@user.role.alias == "admin_min")
    end

    def admin_ind?
      true if(@user.role.alias == "admin_ind")
    end

    def resolve
      scope
    end
  end



end
