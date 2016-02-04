class Account::ProfileDataStepsController < Account:: BaseController

  include Wicked::Wizard

  steps :personal_info, :avatar

  before_action :set_profile

  def show
    render_wizard
  end

  def update
    @profile.step_validation = step
    @profile.attributes = profile_params
    if @profile.save
      respond_to do |format|
        format.html { redirect_to next_wizard_path }
        format.json { render json: {result: :success, location: next_wizard_path} }
      end
    else
      respond_to do |format|
        format.html { render_wizard }
        format.json { render json: {result: :error} }
      end
    end
  end

  def finish_wizard_path
    account_profile_path
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :surname, :status_text, :avatar)
  end

end