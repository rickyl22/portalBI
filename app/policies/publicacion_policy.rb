class PublicacionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def index?
    return true if user.present? && (rol == "admin")
  end

  def create?
    return true if user.present? && (rol == "admin")
  end

  def show?
    return true# if user.present? && (rol == "admin")
  end

  def update?
    return true if user.present? && (rol == "admin")
  end

  def destroy?
    return true if user.present? && (rol == "admin")
  end

  private

  def publicacion
    record
  end
end
