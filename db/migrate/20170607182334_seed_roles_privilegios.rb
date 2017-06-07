class SeedRolesPrivilegios < ActiveRecord::Migration[5.1]
  def up
    #Privilegios para el usuario administrador- Se le asigna el privilegio TODOS que incluiye todos los privilegios
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (1,31,0, NOW(), NOW())"
    #Privilegios para el usuario administrador Mineria - Se le asigna el privilegio TODOS MINERIA que incluiye todos los privilegios donde el 'modulo' es mineria
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (3,32, NOW(),0, NOW())"
    #Privilegios para el usuario administrador Indicadores- Se le asigna el privilegio TODOS MINERIA que incluiye todos los privilegios donde el 'modulo' es indicadores
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (4,33, NOW(),0, NOW())"
    #Privilegios para el usuario Consultor lider- Se le asigna los privilegios para Crear, Ver, Asignar, Cerrar, Comentar y Anular Casos de mineria
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,1, NOW(),0, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,3, NOW(),0, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,6, NOW(),0, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,7, NOW(),0, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,10, NOW(),0, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,13, NOW(),0, NOW())"
    #Privilegios para el usuario Consultor- Se le asigna los privilegios para Ver, Cambiar estatus y comentar  sus casos asignados
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (6,2, NOW(),1, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (6,14, NOW(),1, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (6,9, NOW(),1, NOW())"
    #Privilegios para el usuario cliente- Se le asigna los privilegios para Crear Caso y  Ver, Cargar Driver de sus casos asignados
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (7,1, NOW(),0, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (7,2, NOW(),1, NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (7,11, NOW(),1, NOW())"
  end
end
