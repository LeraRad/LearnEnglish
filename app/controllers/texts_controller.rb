class TextsController < ApplicationController
  
  def index
    @text = Text.all
  end

  def show
    @text = Text.find(params[:id])
  end

end
