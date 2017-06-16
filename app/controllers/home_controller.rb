class HomeController < ApplicationController
  layout 'layout'
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  
  def index
  end

  def noticia
  end

  def proyectos
  end

  def nosotros
  end
end
