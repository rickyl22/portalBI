class Documento < ApplicationRecord
	belongs_to :caso
	mount_uploader :attachment, AttachmentUploader
end
