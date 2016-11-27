module Api
  module V1
    class RecordsController < ApplicationController
       def create
        render_service CreateRecordService.new(params[:data])
       end

       def index
        render_service GetRecordsService.new(params[:data])
       end

       def show
        render_service GetRecordService.new(record_id: params[:id]) 
       end

       def update
        render_service UpdateRecordService.new(params[:data].merge(id: params[:id]))
       end

       def destroy
        render_service DeleteRecordService.new(record_id: params[:id]) 
       end
    end
  end
end
