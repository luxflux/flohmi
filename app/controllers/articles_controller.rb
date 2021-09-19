class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = policy_scope(Article).includes(:images_blobs, :contact_requests).order(id: :desc)
    @articles = @articles.where(category_id: params[:category_id]) if params[:category_id]
    authorize @articles

    respond_to do |format|
      format.html
      format.rss do
        render layout: false
      end
    end
  end

  # GET /articles/1
  def show
    authorize @article
  end

  # GET /articles/new
  def new
    @article = Article.new
    authorize @article
  end

  # GET /articles/1/edit
  def edit
    authorize @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    authorize @article

    if @article.save
      @article.images.attach(params[:article][:images]) if params[:article][:images]

      redirect_to @article, notice: {
        title: 'Artikel erstellt',
        text: 'Artikel wurde erfolgreich erstellt',
      }
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    authorize @article

    @article.images.attach(params[:article][:images]) if params[:article][:images]

    if @article.update(article_params)
      redirect_to @article, notice: {
        title: 'Änderungen gespeichert',
        text: 'Die Änderungen am Artikel wurden erfolgreich gespeichert',
      }
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    authorize @article

    redirect_to articles_url, notice: {
      title: 'Artikel gelöscht',
      text: 'Der Artikel wurde gelöscht',
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, :price_range, :category_id)
    end
end
