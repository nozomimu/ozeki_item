class ItemsController < ApplicationController

  def index
    @q = Item.search(params[:q])
    @items = @q.result(distinct: true)
  end


  def new
  	@item = Item.new
    @disc = @item.discs.build
    # @song = @disc.songs.build
    3.times{@song = @disc.songs.build}

  end

  def create
  	@item = Item.new(item_params)
    #Rails.logger.info(@item)
    @item.save
    # Rails.logger.info(@item)
    redirect_to ("/items") 
   
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      #updateが完了したら一覧ページへリダイレクト
      redirect_to ("/items")
    else
      #updateを失敗すると編集ページへ
      render ("items/edit")
    end
    
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    redirect_to("/items")
  end

  private
    def item_params
        params.require(:item).permit(:artist_name , :item_name, :image, :price, :label_name, :stock, :category_id, :release_date,discs_attributes:[:disc_name,songs_attributes:[:number, :id,:song_name]])
    end
end
