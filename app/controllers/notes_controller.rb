class NotesController < ApplicationController
  before_action :require_signed_in

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save

    redirect_to track_url(@note.track_id)
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.user_id != current_user.id
      flash.now[:errors] = ["Can't delete someone else's note!"]
    else
      @note.destroy
      redirect_to track_url(@note.track_id)
    end
  end

  private
  def note_params
    params.require(:note).permit(:content, :track_id)
  end
end
