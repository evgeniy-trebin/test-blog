class Account::ArticlesController < Account::BaseController
  before_action :set_account_article, only: [:show, :edit, :update, :destroy]

  # GET /account/articles
  # GET /account/articles.json
  def index
    @articles = current_user.articles.all
  end

  # GET /account/articles/1
  # GET /account/articles/1.json
  def show
  end

  # GET /account/articles/new
  def new
    @article = Article.new
  end

  # GET /account/articles/1/edit
  def edit
  end

  # POST /account/articles
  # POST /account/articles.json
  def create
    @article = current_user.articles.build
    @article.attributes = article_params

    respond_to do |format|
      if @article.save
        format.html { redirect_to account_article_url(@article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: account_article_url(@article) }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/articles/1
  # PATCH/PUT /account/articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to account_article_url(@article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: account_article_url(@article) }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/articles/1
  # DELETE /account/articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to account_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_article
      @article = current_user.articles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :announce, :content, :is_published, :published_at)
    end
end
