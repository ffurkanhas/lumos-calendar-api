module Calendar
  module Api
    module V1
      class EventsController < ApplicationController
        before_action :set_event, only: [:show, :update, :destroy]

        # GET /events
        def index
          @events = Event.all

          render json: @events
        end

        # GET /events/1
        def show
          render json: @event
        end

        # GET /events/search/{keyword}
        def search
          @events = Event.all

          result_array = Array.new

          @events.each_entry { |sonuc|
            if params['keyword'].downcase.in? sonuc.title.downcase or params['keyword'].downcase.in? sonuc.description.downcase

              result_array << sonuc
            end
          }

          render json: result_array
        end

        # GET /events/user/{userid}
        def get_with_user_id
          @events = Event.all

          result_array = Array.new

          @events.each_entry { |sonuc|
            if params['userid'].to_i == sonuc.user_id

              result_array << sonuc
            end
          }

          render json: result_array
        end

        # POST /events
        def create
          @event = Event.new(event_params)

          if @event.save
            render json: @event, status: :created, location: @event
          else
            render json: @event.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /events/1
        def update
          if @event.update(event_params)
            render json: @event
          else
            render json: @event.errors, status: :unprocessable_entity
          end
        end

        # DELETE /events/1
        def destroy
          @event.destroy
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_event
          @event = Event.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def event_params
          params.require(:event).permit(:title, :description, :start_time, :end_time, :recurring, :reminder, :user_id)
        end
      end
    end
  end
end
