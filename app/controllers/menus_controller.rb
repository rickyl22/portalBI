class MenusController < ApplicationController
  before_action :require_authentication
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized

  def index


  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
