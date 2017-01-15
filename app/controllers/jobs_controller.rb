class JobsController < ApplicationController

  def index
    @ads = Ad.by_jobs.paginate(page: params[:page])
  end

  def show
    @ad = Ad.by_jobs.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new
    @ad.category = JOBS_CATEGORY
    @ad.title = params[:title]
    @ad.description = params[:description]
    @ad.start_date = params[:start_date]
    @ad.end_date = params[:end_date]

    if @ad.save
      redirect_to jobs_path, notice: 'Ad posted.'
    else
      flash.now[:errors] = @ad.errors.full_messages
      render 'new'
    end
  end

end
