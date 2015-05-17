class AlbumsController < ApplicationController
  before_action :require_signed_in

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      @band = @album.band
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
    render :edit
  end

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
    @band = @album.band
    render :show
  end

  def destroy
    album = Album.find(params[:id])
    album.delete
    redirect_to band_url(album.band_id)
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end
