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
        redirect_to action:"show",id: @picture.id
      else
        #保存失敗時
        #render 'new'
        flash[:danger] = "画像を選択してください"
        redirect_to root_path
      end
    end
    
    #生成した画像を表示するアクション
    def show
      @picture = Picture.find_by_id(params[:id])
      #見つからなかった場合、rootに戻る
      if @picture.nil? then
        flash[:danger] = "画像が見つかりませんでした。再生成してください。"
        redirect_to root_path
      end
      
    end
      
      private
        def picture_params
          params.require(:picture).permit(:title, :subtitle, :font_size, :band_width, :band_height, :filepath)
        end

end
