class SeedRolesPrivilegios < ActiveRecord::Migration[5.1]
  def up
    #Privilegios para el usuario administrador- Se le asigna el privilegio TODOS que incluiye todos los privilegios
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (1,31,0, NOW(), NOW())"
    #Privilegios para el usuario administrador Mineria - Se le asigna el privilegio TODOS MINERIA que incluiye todos los privilegios donde el 'modulo' es mineria
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (2,32,0, NOW(), NOW())"
    #Privilegios para el usuario administrador Indicadores- Se le asigna el privilegio TODOS INDICADORES que incluiye todos los privilegios donde el 'modulo' es indicadores
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (3,33,0 ,NOW(), NOW())"
    #Privilegios para el usuario Consultor lider- Se le asigna los privilegios para Crear, Ver, Asignar, Cerrar, Comentar y Anular Casos de mineria
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (4,1,0, NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (4,3, 0, NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (4,6, 0, NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (4,7, 0, NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (4,10, 0, NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (4,13, 0, NOW(), NOW())"
    #Privilegios para el usuario Consultor- Se le asigna los privilegios para Ver, Cambiar estatus y comentar  sus casos asignados
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,2, 1, NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,14, 1, NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (5,9,1, NOW(), NOW())"
    #Privilegios para el usuario cliente- Se le asigna los privilegios para Crear Caso y  Ver, Cargar Driver de sus casos asignados
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (6,1, 0, NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (6,2,1,NOW(), NOW())"
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (6,11,1, NOW(), NOW())"
    #Privilegios para el usuario cliente de indicadores - Se le asigna los privilegios para Ver indicadores
    execute "INSERT INTO roles_privilegios (role_id, privilegio_id, alcance, created_at, updated_at) VALUES (7,28,1,NOW(), NOW())"

  end
end
