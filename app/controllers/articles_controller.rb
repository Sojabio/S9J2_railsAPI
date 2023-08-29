class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: [:create, :update]
  before_action :user_is_current_user, only: [:edit, :update, :destroy]


  # GET /articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  #hides the post if decided by the user
  def hide
    @article = Article.find(params[:id])

    if @article
      @article.hidden = true
      if @article.save
        render json: { message: "L'article a été caché." }
      else
        render json: { error: "L'article n'a pas pu être caché." }, status: :unprocessable_entity
      end
    else
      render json: { error: "L'article n'a pas pu être caché." }, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :user_id, :hidden)
    end

    def user_is_current_user
      unless current_user == @article.user
        render json: { error: "Accès non autorisé" }, status: :unauthorized
      end
    end

end
