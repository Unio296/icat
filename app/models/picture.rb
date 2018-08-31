class Picture < ApplicationRecord
  mount_uploader :filepath, PictureUploader
  attr_accessor :title
  attr_accessor :subtitle
end
