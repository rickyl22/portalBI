class Documento < ApplicationRecord
	belongs_to :caso, index: true
end
