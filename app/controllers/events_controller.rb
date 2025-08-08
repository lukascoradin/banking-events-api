class EventsController < ApplicationController

  def create
    service = EventService.new

    result = case params[:type]
    when 'deposit'
      service.deposit(params[:destination], params[:amount])
 
    end
    if result
      render json: result, status: :created
    else
      render json: '0', status: :not_found
    end
  end
end
