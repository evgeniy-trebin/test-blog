module CrudConcern

  extend ActiveSupport::Concern

  def objects
    raise NotImplementedError, 'This method must be implemented!'
  end

  def object
    raise NotImplementedError, 'This method must be implemented!'
  end

  def process_action(execution)
    if execution
      respond_to do |format|
          format.html { send("success_#{action_name}_html") }
          format.json { send("success_#{action_name}_json") }
        end
    else
      respond_to do |format|
        format.html { send("failed_#{action_name}_html") }
        format.json { send("failed_#{action_name}_json") }
      end
    end
  end

  # CREATE callbacks
  # ------------------------------------------------------------------------------------
  def success_create_html
    redirect_to success_create_redirect_to, notice: 'Article was successfully created.'
  end

  def success_create_json
    render :show, status: :created, location: success_create_redirect_to
  end

  def failed_create_html
    render :new
  end

  def failed_create_json
    render json: object.errors, status: :unprocessable_entity
  end

  # UPDATE callbacks
  # ------------------------------------------------------------------------------------
  def success_update_html
    redirect_to success_update_redirect_to, notice: 'Article was successfully updated.'
  end

  def success_update_json
    render :show, status: :ok, location: success_update_redirect_to
  end

  def failed_update_html
    render :edit
  end

  def failed_update_json
    render json: object.errors, status: :unprocessable_entity
  end

  # DESTROY callbacks
  # ------------------------------------------------------------------------------------
  def success_destroy_html
    redirect_to success_destroy_redirect_to, notice: 'Article was successfully destroyed.'
  end

  def success_destroy_json
    head :no_content
  end

  def failed_destroy_html
    redirect_to failed_destroy_redirect_to, notice: 'Article was successfully destroyed.'
  end

  def failed_destroy_json
    render json: object.errors, status: :unprocessable_entity
  end

  # HELPERS for redirect
  # ------------------------------------------------------------------------------------
  def success_create_redirect_to
    account_article_url(article)
  end

  def success_update_redirect_to
    account_article_url(article)
  end

  def success_destroy_redirect_to
    account_articles_url
  end

  def failed_destroy_redirect_to
    account_articles_url
  end

end