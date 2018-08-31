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
        redirect_to @picture
      else
        #保存失敗時
      end
    end
    
    #生成した画像を表示するアクション
    def show
      @picture = Picture.find(params[:id])
    end
      
      private
  
        def picture_params
          params.require(:picture).permit(:title, :subtitle, :filepath)
        end

end
