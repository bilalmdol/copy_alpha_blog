class ArticlesController < ApplicationController
  def show
    @article = Articles.find(params[:id])
  end

  def index
    @articles = Articles.all
  end

  def new
    @newArticle = Articles.new #important for initializations
  end

  def edit
    @article = Articles.find(params[:id])
  end

  def create
    @newArticle = Articles.new(params.require(:articles).permit(:title, :desc))
    if @newArticle.save
      flash[:notice] = "Article Successfully Saved!"
      redirect_to @newArticle
    else render "new"     end
  end

  def update
    @article = Articles.find(params[:id])
    if @article.update(params.require(:articles).permit(:title, :desc))
      flash[:notice] = "Article was Edited Successfully!"
      redirect_to @article
    else render "edit"     end
  end

  def destroy
    @articleToDestroy = Articles.find(params[:id])
    @articleToDestroy.destroy

    redirect_to articles_path
  end
end
