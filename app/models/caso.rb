class Caso < ApplicationRecord
	has_many :comentarios
	has many :documentos
	belongs_to :usuario, index: true
end
