class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :update, :destroy]

  # GET /calendars
  def index
    @calendars = Calendar.all

    render json: @calendars
  end

  # GET /calendars/search/{keyword}
  def search
    @calendars = Calendar.all

    result_array = Array.new

    @calendars.each_entry { |sonuc|
      if params['keyword'].in? sonuc.title.downcase or params['keyword'].in? sonuc.description.downcase

        result_array << sonuc
      end
    }

    render json: result_array
  end

  # GET /calendars/1
  def show
    render json: @calendar
  end

  # POST /calendars
  def create
    @calendar = Calendar.new(calendar_params)

    if @calendar.save
      render json: @calendar, status: :created, location: @calendar
    else
      render json: @calendar.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /calendars/1
  def update
    if @calendar.update(calendar_params)
      render json: @calendar
    else
      render json: @calendar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /calendars/1
  def destroy
    @calendar.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def calendar_params
      params.require(:calendar).permit(:title, :userid, :description, :start_date, :end_date, :reminder, :recurring)
    end
end
