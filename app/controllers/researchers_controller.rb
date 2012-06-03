class ResearchersController < ApplicationController
  def new
    @researcher = Researcher.new
  end

  def create
    researcher = Researcher.new params[:researcher]
    researcher.activated = false

    if researcher.save
      render :thank_you
    else
      render :new
    end
  end
end