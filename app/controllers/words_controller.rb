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

  def edit
    @word = Word.find(params[:id])
  end 

def update
  @word = Word.find(params[:id])
  respond_to do |format|
    if @word.update(params.require(:word).permit(:eng_word,:translation,:transcription))
      format.html { redirect_to words_path, notice: "The word was successfully updated." }
      format.json { render :show, status: :ok, location: @word }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @word.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @word = Word.find(params[:id])
end

def destroy
  # Perform the lookup
  @word = Word.find(params[:id])

  #Destroy/delete the record
  @word.destroy

  #Redirect
  respond_to do |format|
    format.html { redirect_to words_url, notice: "The word #{@word.eng_word} was removed." }
  end
end

  
end
