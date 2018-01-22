class DiscsController < ApplicationController
  def new
  	@disc = Disc.new
  	@disc.songs.build
  end

  def create
  	@disc = Disc.new(item_params)
    @disc.save
    redirect_to ("/items")
  end

  private
def disc_params
  params.require(:disc).permit(:disc_name,songs_attributes: [:song_name,:number])
end
end
