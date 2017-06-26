json.extract! historial, :id, :evento, :fecha, :usuario_id, :estatus, :caso_id, :created_at, :updated_at
json.url historial_url(historial, format: :json)
