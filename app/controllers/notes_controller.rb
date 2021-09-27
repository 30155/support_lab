class NotesController < ApplicationController
  def index
    @notes = Note.order(word_kana: "ASC")
    @note = Note.new
  end
end
