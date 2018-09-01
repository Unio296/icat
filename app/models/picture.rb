class Picture < ApplicationRecord
  # uploaderの定義
  mount_uploader :filepath, PictureUploader #filepathにアップロードしたファイルのパスが入る？

  #擬似要素の定義
  attr_accessor :title
  attr_accessor :subtitle
  attr_accessor :font_size  #文字のサイズ(default 60 range 20 ~ 100)
  attr_accessor :band_width   #帯横幅サイズ(default 100% range:0~100%)
  attr_accessor :band_height  #帯の縦幅サイズ(default 60% range:0~100%)
  attr_accessor :band_opacity #背景の透明度(default 0.5 range:0~1)
  #バリデーション
  validates :filepath, presence: true
  
end
