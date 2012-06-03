class Admin::ResearchersController < Admin::BaseController

  def index
    @researchers = Researcher.order('id ASC').all
  end

  def activate
    @researcher = Researcher.find params[:id]
    @researcher.update_attributes(:activated => true)

    redirect_to [:admin, :researchers]
  end

  def deactivate
    @researcher = Researcher.find params[:id]
    @researcher.update_attributes(:activated => false)

    redirect_to [:admin, :researchers]
  end
end