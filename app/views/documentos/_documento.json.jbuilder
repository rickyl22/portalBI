json.extract! documento, :id, :nombre, :attachment, :estatus, :created_at, :updated_at
json.url documento_url(documento, format: :json)
