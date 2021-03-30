class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(get_valid_params)
    if @article.save
      flash.notice = "Article is successfully saved!"
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    if @article.update(get_valid_params)
      flash.notice = "Article is successfully updated!"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def get_valid_params
    params.require(:article).permit(:title, :description)
  end
end
