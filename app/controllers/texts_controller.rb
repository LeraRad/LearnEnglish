class TextsController < ApplicationController
  def index
      @text = Text.all
    end

    def new
      @text = Text.new
    end

    def create
      @text = Text.new(params.require(:text).permit(:title,:body))

      respond_to do |format|
        if @text.save
          format.html { redirect_to texts_path, notice: "New Text was successfully added." }
          format.json { render :show, status: :created, location: @text }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @text.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
    @text = Text.find(params[:id])
  end 

def update
  @text = Text.find(params[:id])
  respond_to do |format|
    if @text.update(params.require(:text).permit(:title,:body))
      format.html { redirect_to text_path, notice: "The text was successfully updated." }
      format.json { render :show, status: :ok, location: @text }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @text.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @text = Text.find(params[:id])
end

def destroy
  # Perform the lookup
  @text = Text.find(params[:id])

  #Destroy/delete the record
  @text.destroy

  #Redirect
  respond_to do |format|
    format.html { redirect_to words_url, notice: "The text #{@text.title} was removed." }
  end
end
end
