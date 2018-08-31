class PictureUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  WIDTH = 1200
  HEIGHT = 630
  process resize_to_limit:[WIDTH,HEIGHT]
  process :add_title

  FONT = "#{Rails.root}/public/memoir.otf"

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  private
    # 画像にテキストを追加するメソッド
    def add_title
      manipulate! do |img|
        img.combine_options do |c|
          c.gravity 'center'                  #位置は画像中央
          c.fill 'black'
          c.draw "fill-opacity 0.5 rectangle 0, #{HEIGHT*0.25}, #{WIDTH}, #{HEIGHT*0.75}"
          
          c.font FONT
          c.fill 'white'                      #文字色
          c.pointsize '60'                    #文字サイズ
          c.draw "text 0,0 #{model.title}"    #テキスト挿入
        end
        img = yield(img) if block_given?
        img
      end
    end

# 日本語のファイル名が「__」に置き換わるのを防止
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:print:]]/

end
