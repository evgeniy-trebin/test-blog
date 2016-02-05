class Account::ProfilesController < Account::BaseController
  def show
    @profile = current_user.profile.decorate
    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end
end
