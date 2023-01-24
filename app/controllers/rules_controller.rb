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

  def edit
    @rule = Rule.find(params[:id])
  end 

def update
  @rule = Rule.find(params[:id])
  respond_to do |format|
    if @rule.update(params.require(:rule).permit(:title,:body))
      format.html { redirect_to rules_path, notice: "The rule was successfully updated." }
      format.json { render :show, status: :ok, location: @rule }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @rule.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @rule = Rule.find(params[:id])
end

def destroy
  # Perform the lookup
  @rule = Rule.find(params[:id])

  #Destroy/delete the record
  @rule.destroy

  #Redirect
  respond_to do |format|
    format.html { redirect_to words_url, notice: "The rule #{@rule.title} was removed." }
  end
end
end
