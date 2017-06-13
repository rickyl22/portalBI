class Comentario < ApplicationRecord
	belongs_to :caso, index: true
end
