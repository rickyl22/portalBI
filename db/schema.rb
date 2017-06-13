# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170607184406) do

  create_table "casos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "act_tabla"
    t.string "agrup"
    t.string "altas"
    t.string "arpu"
    t.text "campos"
    t.string "complejidad"
    t.text "condiciones"
    t.string "consultor"
    t.string "especifique"
    t.date "fech_asig"
    t.date "fecha_creado"
    t.date "fecha_req"
    t.string "fijo"
    t.string "im"
    t.string "infosoft"
    t.string "movil"
    t.string "otro"
    t.string "parque"
    t.date "periodo_desde"
    t.date "periodo_hasta"
    t.string "phone"
    t.string "pre_post"
    t.string "recargas"
    t.string "separacion"
    t.string "status"
    t.string "tipo_archivo"
    t.string "tipo_caso"
    t.string "titulo"
    t.string "tlv"
    t.string "tv"
    t.string "usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "fecha"
    t.text "texto"
    t.string "autor"
    t.integer "caso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permisos_asignados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "privilegio_id"
    t.bigint "role_id"
    t.bigint "usuario_id"
    t.integer "recurso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["privilegio_id"], name: "index_permisos_asignados_on_privilegio_id"
    t.index ["role_id"], name: "index_permisos_asignados_on_role_id"
    t.index ["usuario_id"], name: "index_permisos_asignados_on_usuario_id"
  end

  create_table "privilegios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "modulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "alias"
    t.string "descripcion"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_privilegios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "privilegio_id"
    t.bigint "role_id"
    t.integer "alcance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["privilegio_id"], name: "index_roles_privilegios_on_privilegio_id"
    t.index ["role_id"], name: "index_roles_privilegios_on_role_id"
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "usuario"
    t.string "codigo_empleado"
    t.string "area"
    t.string "gerencia"
    t.string "cargo"
    t.string "correo"
    t.string "telefono"
    t.string "nombre"
    t.string "apellido"
    t.string "supervisor"
    t.string "justificacion"
    t.string "estatus"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
