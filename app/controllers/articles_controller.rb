class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    #before_action :authenticate_user! , only: [:edit, :update, :destroy, :new, :create]
    before_action :authenticate_editor! , only: [:create, :new, :update, :edit]
    before_action :authenticate_admin! , only: [:destroy]


  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    respond_to do |format|
      if @article.save
        format.html {redirect_to @article, notice: "Articulo #{@article.title}  creado."}
        format.json {render :show, status: :created, location: @article}
      else
        format.html { render :new }
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    
    #raise params.to_yaml
  end

  def index
    @articulos = Article.all
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html {redirect_to @article, notice: "Articulo #{@article.title}  mofificado."}
        format.json {render :show, status: :ok, location: @article}
      else
        format.html {render :edit}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html {redirect_to @article, notice: "Articulo #{@article.title}  eliminado."}
      fotmar.json {head :no_content}
    end 
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
