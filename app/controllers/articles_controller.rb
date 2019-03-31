class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    #before_action :authenticate_user! , only: [:edit, :update, :destroy, :new, :create]
    before_action :authenticate_editor! , only: [:create, :new, :update, :edit]
    before_action :authenticate_admin! , only: [:destroy]

  def search
    if params.has_key?(:titulo) && params[:titulo].length > 0
      @articles = Article.titulo(params[:titulo])
    else
      @articles = Article.all
    end
  end

  def index
    @articulos = Article.paginate(:page => params[:page], :per_page => 4).ultimos
    if user_signed_in? && current_user.is_editor? && !params.has_key?(:normal)
      render :"admin_article"
    end
  end

  def show
    @comment = Comment.new
    #raise params.to_yaml
  end

def new
  @article = Article.new
    @categories = Category.all
  end

  def create
      @article = current_user.articles.new(article_params)
      @article.categoryMetodo = params[:categories]
      #raise @article.to_yaml
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
  




  def edit
    
  end

  def update
  #  @article.categoryMetodo = @article.categories.ids
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
      format.json {head :no_content}
    end 
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :categories, :cover)
  end

  def set_article
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert:"No existe ese articulo"
    end
  end
end
