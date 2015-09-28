class ArticlesController < ApplicationController
  before_action :logged_in?, only: [:new, :edit, :destroy]

  def index
    @articles = Article.all
    current_user

    render :index
  end

  def new
    @article = Article.new
    current_user

    render :new
  end

  def create
    @article = Article.create(article_params)
    current_user

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def edit
    @article = Article.find(params[:id])
    render :edit
  end

  def update
    article_id = params[:id]
    article = Article.find(article_id)

    update_attributes = params.require(:article).permit(:title, :content)
    article.update_attributes(update_attributes)

    redirect_to articles_path
  end

  def destroy
    id = params[:id]
    article = Article.find(id)
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
