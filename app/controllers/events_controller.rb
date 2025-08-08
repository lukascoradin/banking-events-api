class EventsController < ApplicationController

  def create
    service = EventService.new

    result = case params[:type]
    when 'deposit'
      service.deposit(params[:destination], params[:amount])
    when 'withdraw'
      service.withdraw(params[:origin], params[:amount])
    when 'transfer'
      service.transfer(params[:origin], params[:destination], params[:amount])
    end
    if result
      render json: result, status: :created
    else
      render json: '0', status: :not_found
    end
  end

  def reset
    Account.delete_all
    render json: 'OK', status: :ok
  end
end
