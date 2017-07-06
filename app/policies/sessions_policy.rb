class SessionPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.admin?
        
        scope.all
      elsif user.admin_min?
        
        scope.all
      elsif user.admin_ind?
        
        scope.all
      elsif user.cons_lid?
        
        scope.all
      elsif user.cons?
        
        scope.all
      elsif user.cli?
        
        scope.all
      end
    end
  end

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    if (user == resource)
      p "Si es el mismo recurso"
    end
    return true if logged_in? && user == article.user
  end

  def destroy?
    return true if logged_in? && user == article.user
  end

  private
  def article
    record
  end

end