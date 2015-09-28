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
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
