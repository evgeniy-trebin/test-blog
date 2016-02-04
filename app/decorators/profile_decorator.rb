class ProfileDecorator < Draper::Decorator
  delegate_all

  def full_name
    [name, surname].compact.join(' ')
  end

  def show_name
    nickname.present? ? nickname : (full_name.present? ? full_name : user.email)
  end

end
