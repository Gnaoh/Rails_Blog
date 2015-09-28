class ArticlesController < ApplicationController
  before_action :logged_in?, only: [:new, :edit, :destroy]
  before_action :authorize, only: [:edit, :destory]



  def index
    @articles = Article.all
    current_user

  end

  def new
    @article = Article.new
    current_user

  end

  def create
    @article = Article.create(article_params)
    current_user

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @user = current_user
    @article = Article.find(params[:id])
  end

  def update
    @user = current_user
    article_id = params[:id]
    article = Article.find(article_id)

    update_attributes = params.require(:article).permit(:title, :content)
    article.update_attributes(update_attributes)

    redirect_to articles_path
  end

  def destroy
    @user = current_user
    id = params[:id]
    article = Article.find(id)
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

 def authorize
    @article = Article.find(params[:id])
    unless @article.user_id == current_user.id 
      flash[:notice] = "You are not the creator of this article, therefore you're not permitted to edit or destroy this article"
      redirect_to root_path # or anything you prefer
      return false # Important to let rails know that the controller should not be executed
    end
  end
  
end
