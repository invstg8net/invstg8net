class Admin::ResearchersController < Admin::BaseController

  def index
    @researchers = Researcher.all
  end

  def activate
    @researcher = Researcher.find params[:id]
    @researcher.update_attributes(:activated => true)
  end

  def deactivate
    @researcher = Researcher.find params[:id]
    @researcher.update_attributes(:activated => false)
  end
end