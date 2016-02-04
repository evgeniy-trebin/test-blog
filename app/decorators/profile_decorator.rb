class ProfileDecorator < Draper::Decorator
  delegate_all

  def full_name
    [name, surname].compact.join(' ')
  end

end
