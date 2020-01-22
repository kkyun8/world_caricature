class Api::NewsController < ApplicationController
  PER = 8

  def index
    @news = News.page(params[:page]).per(PER).where(delflg: 0)
    #User.page(params[:page]).limit_value       #=> 20
    paginate = {
      totalPages: News.page(params[:page]).per(PER).where(delflg: 0).total_pages,
      nextPage: News.page(params[:page]).per(PER).where(delflg: 0).next_page,
      prevPage: News.page(params[:page]).per(PER).where(delflg: 0).prev_page,
      firstPageFlg: News.page(params[:page]).per(PER).where(delflg: 0).first_page?,
      lastPageFlg: News.page(params[:page]).per(PER).where(delflg: 0).last_page?
    }

    render json: { result: 'SUCCESS', message: 'Loaded', news: @news, 
      perPage: PER,
      totalRows: News.page(params[:page]).where(delflg: 0).count,
      currentPage: News.page(params[:page]).per(PER).where(delflg: 0).current_page,
      paginate: paginate }
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