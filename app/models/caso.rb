class Caso < ApplicationRecord
	has_many :comentarios
	has_many :documentos
	has_many :historial
	belongs_to :usuario
end
