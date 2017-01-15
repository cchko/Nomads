class StaysController < ApplicationController

  def index
    @ads = Ad.by_stays
  end

  def show
    @ad = Ad.by_stays.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new
    @ad.category = STAYS_CATEGORY
    @ad.title = params[:title]
    @ad.description = params[:description]
    @ad.start_date = params[:start_date]
    @ad.end_date = params[:end_date]

    if @ad.save
      redirect_to stays_path, notice: 'Ad posted.'
    else
      flash.now[:errors] = @ad.errors.full_messages
      render 'new'
    end
  end

end
