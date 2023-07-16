# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    articles = Article.all

    render json: { articles: }
  end

  def show
    if @article
      render json: { article: @article }
    else
      render_404
    end
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: { article: }, status: :created
    else
      render_400
    end
  end

  def update
    if @article.update(article_params)
      render json: { article: @article }
    else
      render_400
    end
  end

  def destroy
    @article.destroy

    head :no_content
  end

  private

  def set_article
    @article = Article.find_by(id: params[:id])
    unless (@article)
      render_404
    end
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
