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

ActiveRecord::Schema.define(version: 20170803150728) do

  create_table "activaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "fecha"
    t.integer "cantidad"
    t.string "plataforma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "fecha"
    t.integer "cantidad"
    t.string "plataforma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "altas_plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "fecha"
    t.string "plan"
    t.integer "cantidad"
    t.string "plataforma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "casos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "act_tabla"
    t.string "agrup"
    t.string "altas"
    t.string "arpu"
    t.text "campos"
    t.string "complejidad"
    t.text "condiciones"
    t.string "consultor_id"
    t.string "especifique"
    t.date "fech_asig"
    t.date "fecha_creado"
    t.date "fecha_req"
    t.date "fecha_cerrado"
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
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_casos_on_usuario_id"
  end

  create_table "comentarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "fecha"
    t.text "texto"
    t.string "autor"
    t.bigint "caso_id"
    t.integer "role_id"
    t.integer "leido_admin"
    t.integer "leido_cons_lid"
    t.integer "leido_cons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caso_id"], name: "index_comentarios_on_caso_id"
  end

  create_table "documentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "attachment"
    t.string "estatus"
    t.bigint "caso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caso_id"], name: "index_documentos_on_caso_id"
  end

  create_table "estadisticas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "descripcion"
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "evento"
    t.datetime "fecha"
    t.integer "usuario_id"
    t.string "estatus"
    t.bigint "caso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caso_id"], name: "index_historials_on_caso_id"
  end

  create_table "kpis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "nombre"
    t.text "descripcion"
    t.text "portada"
    t.text "dashboard"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "noticia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "imagen"
    t.text "titulo"
    t.text "descripcion"
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

  create_table "pronostico_alta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "fecha"
    t.integer "cantidad"
    t.string "plataforma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pronostico_recargas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "fecha"
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proyectos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "imagen"
    t.text "titulo"
    t.text "descripcion"
    t.text "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publicaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "titulo"
    t.text "descripcion"
    t.text "imagen"
    t.text "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recargas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "FECHA"
    t.integer "CLIENTES"
    t.integer "RECARGAS"
    t.float "BS_TOTAL", limit: 24
    t.float "BS_TOTAL_IVA12", limit: 24
    t.float "BS_TOTAL_IVA10", limit: 24
    t.float "FISICA", limit: 24
    t.float "FISICA_BSF", limit: 24
    t.float "FISICA_BSF_SINIVA12", limit: 24
    t.float "FISICA_BSF_SINIVA10", limit: 24
    t.float "P2P", limit: 24
    t.float "P2P_BSF", limit: 24
    t.float "P2P_BSF_SINIVA12", limit: 24
    t.float "P2P_BSF_SINIVA10", limit: 24
    t.float "GRE", limit: 24
    t.float "GRE_BSF", limit: 24
    t.float "GRE_BSF_SINIVA12", limit: 24
    t.float "GRE_BSF_SINIVA10", limit: 24
    t.float "BANCARIA", limit: 24
    t.float "BANCARIA_BSF", limit: 24
    t.float "BANCARIA_BSF_SINIVA12", limit: 24
    t.float "BANCARIA_BSF_SINIVA10", limit: 24
    t.float "MMO", limit: 24
    t.float "MMO_BSF", limit: 24
    t.float "MMO_BSF_SINIVA12", limit: 24
    t.float "MMO_BSF_SINIVA10", limit: 24
    t.float "TRANSFERENCIA", limit: 24
    t.float "TRANSFERENCIA_BSF", limit: 24
    t.float "TRANSFERENCIA_BSF_SINIVA12", limit: 24
    t.decimal "TRANSFERENCIA_BSF_SINIVA10", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recargas_terminals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TERMINAL"
    t.date "FECHA"
    t.integer "CLIENTES"
    t.integer "RECARGAS"
    t.float "BS_TOTAL", limit: 24
    t.float "BS_TOTAL_IVA12", limit: 24
    t.float "BS_TOTAL_IVA10", limit: 24
    t.float "FISICA", limit: 24
    t.float "FISICA_BSF", limit: 24
    t.float "FISICA_BSF_SINIVA12", limit: 24
    t.float "FISICA_BSF_SINIVA10", limit: 24
    t.float "P2P", limit: 24
    t.float "P2P_BSF", limit: 24
    t.float "P2P_BSF_SINIVA12", limit: 24
    t.float "P2P_BSF_SINIVA10", limit: 24
    t.float "GRE", limit: 24
    t.float "GRE_BSF", limit: 24
    t.float "GRE_BSF_SINIVA12", limit: 24
    t.float "GRE_BSF_SINIVA10", limit: 24
    t.float "BANCARIA", limit: 24
    t.float "BANCARIA_BSF", limit: 24
    t.float "BANCARIA_BSF_SINIVA12", limit: 24
    t.float "BANCARIA_BSF_SINIVA10", limit: 24
    t.float "MMO", limit: 24
    t.float "MMO_BSF", limit: 24
    t.float "MMO_BSF_SINIVA12", limit: 24
    t.float "MMO_BSF_SINIVA10", limit: 24
    t.float "TRANSFERENCIA", limit: 24
    t.float "TRANSFERENCIA_BSF", limit: 24
    t.float "TRANSFERENCIA_BSF_SINIVA12", limit: 24
    t.decimal "TRANSFERENCIA_BSF_SINIVA10", precision: 10
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
    t.boolean "estatus"
    t.string "password_digest"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "historials", "casos"
end
