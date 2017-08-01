class CreateCasos < ActiveRecord::Migration[5.1]
  def change
    create_table :casos do |t|
      t.string :act_tabla
      t.string :agrup
      t.string :altas
      t.string :arpu
      t.text :campos
      t.string :complejidad
      t.text :condiciones
      t.string :consultor_id
      t.string :especifique
      t.date :fech_asig
      t.date :fecha_creado
      t.date :fecha_req
      t.date :fecha_cerrado
      t.string :fijo
      t.string :im
      t.string :infosoft
      t.string :movil
      t.string :otro
      t.string :parque
      t.date :periodo_desde
      t.date :periodo_hasta
      t.string :phone
      t.string :pre_post
      t.string :recargas
      t.string :separacion
      t.string :status
      t.string :tipo_archivo
      t.string :tipo_caso
      t.string :titulo
      t.string :tlv
      t.string :tv
      t.belongs_to :usuario, index: true

      t.timestamps
    end
  end
end
