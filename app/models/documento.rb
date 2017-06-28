class Documento < ApplicationRecord
	belongs_to :caso
	mount_uploader :attachment, AttachmentUploader
	validates_size_of :attachment, maximum: 20.megabyte, message: "El documento no puede ser mayor a 20 MB"
end
