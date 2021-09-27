class NotesController < ApplicationController
  def index
    @notes = Note.order(word_kana: "ASC")
    @note = Note.new
  end

  def create
    @notes = Note.order(word_kana: "ASC")
    @note = Note.new(note_params)
    if @note.save
      redirect_to action: :index
    else
      render :index
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def note_params
    params.require(:note).permit(:word, :word_kana, :summary, :text, :reference).merge(user_id: current_user.id)
  end

end
