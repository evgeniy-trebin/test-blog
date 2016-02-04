module ProfileDataStepsValidations

  def self.included(base)

    base.with_options on: :update do
      validates_presence_of :name, :surname, if: :should_validate_personal_info?
      validates_presence_of :avatar, if: :should_validate_avatar?
    end

    attr_accessor :step_validation

  end

  def step_validation=(value)
    @step_validation = [:personal_info, :avatar].include?(value) ? value : nil
  end

  protected

  def should_validate_avatar?
    @step_validation == :avatar
  end

  def should_validate_personal_info?
    @step_validation == :personal_info
  end
end