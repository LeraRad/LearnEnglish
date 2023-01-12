class RulesController < ApplicationController
  def index
    @rule = Rule.all
  end

  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(params.require(:rule).permit(:title,:body))

    respond_to do |format|
      if @rule.save
        format.html { redirect_to rules_path, notice: "New Rule was successfully added." }
        format.json { render :show, status: :created, location: @rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end
end
