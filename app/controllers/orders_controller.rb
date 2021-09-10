class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def show
    set_order
  end

  def new
    @event = Event.find(params[:event_id])
    @order = Order.new
    authorize @order
  end

  def create
  end

  private

  def orders_params
    params.require(:order).permit(:event_id, :client_id)
  end

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

end
