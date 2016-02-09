module ApplicationHelper

  def t_crud_view(key, hash_params= {})
    t("crud.messages.views.#{key}", hash_params)
  end

end
