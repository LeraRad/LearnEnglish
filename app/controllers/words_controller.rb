class WordsController < ApplicationController
  def index
    @word = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(params.require(:word).permit(:eng_word,:transcription,:translation))

    respond_to do |format|
      if @word.save
        format.html { redirect_to words_path, notice: "New Word was successfully added." }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  
end
