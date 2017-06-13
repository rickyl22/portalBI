class Caso < ApplicationRecord
	has_many :comentarios
	has many :documentos
	belongs_to :usuario
end
