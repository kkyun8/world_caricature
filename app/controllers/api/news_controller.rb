class Api::NewsController < ApplicationController
  PER = 8

  def index
    @news = News.page(params[:page]).per(PER).where(delflg: 0)
    render json: { result: 'SUCCESS', message: 'Loaded', news: @news }
  end

  def show
    @news = News.find(params[:id])
    render json: { result: 'SUCCESS', message: 'getNews', news: @news }
  end

  def create
    @news = News.new(news_params)

    if @news.after_save
      render json: { result: 'SUCCESS', news: @news }
    else
      render json: { result: 'FAIL', news: @news.errors.full_message, news: @news }
    end
  end
  

  private
    def news_params
      params.require(:news).permit(:title, :contents, :delflg)
    end
end