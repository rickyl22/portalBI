class Caso < ApplicationRecord
	has_many :comentarios
	has_many :documentos
	belongs_to :usuario
end
