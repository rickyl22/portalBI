json.extract! documento, :id, :titulo, :path, :created_at, :updated_at
json.url documento_url(documento, format: :json)
