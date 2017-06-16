class MenuPolicy < ApplicationPolicy
  p "Hola"
  class Scope < Scope
    def resolve
      scope
    end
  end
end
