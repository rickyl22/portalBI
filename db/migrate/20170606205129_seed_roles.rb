class SeedRoles < ActiveRecord::Migration[5.1]
  def up
    execute "INSERT INTO roles (alias, nombre, descripcion, created_at, updated_at) VALUES ('admin','Administrador','Administrador general de la plataforma - PortalBI', NOW(), NOW())"
    execute "INSERT INTO roles (alias, nombre, descripcion, created_at, updated_at) VALUES ('admin_min','Administrador de Mineria','Administrador del modulo de Mineria', NOW(), NOW())"
    execute "INSERT INTO roles (alias, nombre, descripcion, created_at, updated_at) VALUES ('admin_ind','Administrador de Indicadores','Administrador del modulo de Indicadores', NOW(), NOW())"
    execute "INSERT INTO roles (alias, nombre, descripcion, created_at, updated_at) VALUES ('cons_lid','Consultor Lider','Rol utilizado por el proveedor para administrar los casos', NOW(), NOW())"
    execute "INSERT INTO roles (alias, nombre, descripcion, created_at, updated_at) VALUES ('cons','Consultor','Rol utilizado por el proveedor para realizar los casos', NOW(), NOW())"
    execute "INSERT INTO roles (alias, nombre, descripcion, created_at, updated_at) VALUES ('cli','Cliente','Cliente que solicita los casos', NOW(), NOW())"
    execute "INSERT INTO roles (alias, nombre, descripcion, created_at, updated_at) VALUES ('cli_ind','Cliente de Indicadores','Cliente que puede visualizar los indicadores', NOW(), NOW())"


  end
end
