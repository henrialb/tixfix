class TicketsController < ApplicationController
  def show
  end

  def index
  end

  def new
  end

  def create
  end

  private

  def ticket_params
    params.require(:ticket).permit(:event_category_id, :order_id, :qr_code, :is_used)
  end
end
