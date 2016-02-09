class Account::ArticlesController < Account::BaseController
  expose(:articles) { current_user.articles }
  expose(:article, attributes: :article_params)

  # POST /account/articles
  # POST /account/articles.json
  def create
    respond_to do |format|
      if article.save
        format.html { redirect_to account_article_url(article), notice: success_notice }
        format.json { render :show, status: :created, location: account_article_url(article) }
      else
        format.html { render :new, alert: failed_alert }
        format.json { render json: article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/articles/1
  # PATCH/PUT /account/articles/1.json
  def update
    respond_to do |format|
      if article.update(article_params)
        format.html { redirect_to account_article_url(article), notice: success_notice }
        format.json { render :show, status: :ok, location: account_article_url(article) }
      else
        format.html { render :edit, alert: failed_alert }
        format.json { render json: article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/articles/1
  # DELETE /account/articles/1.json
  def destroy
    respond_to do |format|
      if article.destroy
        format.html { redirect_to account_articles_url, notice: success_notice }
        format.json { head :no_content }
      else
        format.html { redirect_to account_articles_url, alert: failed_alert }
        format.json { render json: article.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :announce, :content, :is_published, :published_at)
  end

  def success_notice
    t_flash(:success)
  end

  def failed_alert
    t_flash(:fail)
  end

  def t_flash(result)
    t("crud.messages.controllers.#{result}.#{action_name}", model_name: article.class.model_name.human)
  end

end