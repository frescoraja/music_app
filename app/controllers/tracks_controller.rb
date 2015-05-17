class TracksController < ApplicationController
  before_action :require_signed_in

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      @album = @track.album
      render :new
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.delete
    redirect_to album_url(track.album_id)
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  private
  def track_params
    params.require(:track).permit(:track_title, :album_id, :ord, :lyrics, :bonus)
  end
end
