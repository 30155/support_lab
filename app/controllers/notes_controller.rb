class NotesController < ApplicationController
  def index
    @notes = Note.order(word_kana: 'ASC')
    @note = Note.new
  end

  def create
    @notes = Note.order(word_kana: 'ASC')
    @note = Note.new(note_params)
    if @note.save
      redirect_to action: :index
    else
      render :index
    end
  end

  def show
    @notes = Note.order(word_kana: "ASC")
    @note = Note.new
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

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to action: :index
  end

  def search
    @notes = Note.search(params[:keyword]).order(word_kana: "ASC")
    render :index
  end

  private

  def note_params
    params.require(:note).permit(:word, :word_kana, :summary, :text, :reference).merge(user_id: current_user.id)
  end
end
