class Publicacion < ApplicationRecord
  mount_uploader :imagen, ImagenUploader
end
