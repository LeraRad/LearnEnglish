class RulesController < ApplicationController
  
  def index
    @rule = Rule.all
  end

  def show
    @rule = Rule.find(params[:id])
  end
  
end
