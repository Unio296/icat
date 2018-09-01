# encoding: utf-8
class PictureUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  WIDTH = 1200
  HEIGHT = 630
  FONT = "#{Rails.root}/public/rounded-mplus-1c-regular.ttf"

  process resize_to_fit:[WIDTH, HEIGHT]
  process :add_title

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.id}/"
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
          x1 = img.width/2*(1-model.band_width.to_f/100)
          x2 = img.width/2*(1+model.band_width.to_f/100)
          y1 = img.height/2*(1-model.band_height.to_f/100)
          y2 = img.height/2*(1+model.band_height.to_f/100)
          sentense = model.title.gsub(/\r\n|\r|\n/," ")
          #debugger
          c.gravity 'center'                  #位置は画像中央
          c.fill 'black'
          c.draw "fill-opacity 0.5 rectangle #{x1}, #{y1}, #{x2}, #{y2}"
          c.font FONT
          c.fill 'white'                      #文字色
          c.pointsize "#{model.font_size}"    #文字サイズ
          c.draw "text 0,0 '#{sentense}'"    #テキスト挿入
        end
      img = yield(img) if block_given?
      img
      end
    end

    # 背景にいい感じに収まるように文字を調整して返却
    #def prepare_text(text)
      #  text.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    #end

# 日本語のファイル名が「__」に置き換わるのを防止
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:print:]]/

end
