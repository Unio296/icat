class PicturesController < ApplicationController

    #新規の画像をアップロードするアクション
    def new
      @picture = Picture.new
    end
  
    #画像を生成するアクション
    def create
      @picture = Picture.new(picture_params)
      if @picture.save
        #保存成功時
        flash[:success] = "画像を生成しました"
        redirect_to @picture
      else
        #保存失敗時
        render 'new'
      end
    end
    
    #生成した画像を表示するアクション
    def show
      @picture = Picture.find_by_id(params[:id])
      #見つからなかった場合、rootに戻る
      redirect_to root_path if @picture.nil?
    end
      
      private
        def picture_params
          params.require(:picture).permit(:title, :subtitle, :font_size, :band_width, :band_height, :filepath)
        end

end
