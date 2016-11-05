module Api
  module V1
    class RecordsController < ApplicationController
       def create
        render_service CreateRecordService.new(params[:data])
       end

       def index
        render json: '[]'
       end

       def filter_records
        render json: '[]'
       end

       def show
        render json: '[]'
       end

       def update
        render json: '[]'
       end

       def destroy
        render json: '[]'
       end
    end
  end
end