class TicketsController < ApplicationController
  def show
    @ticket = Ticket.find(params[:id])
    @qr_code = @qr_code = RQRCode::QRCode.new(@ticket.qr_code)
    @svg = @qr_code.as_svg
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
