class OrdersController < ApplicationController
  before_action :set_event, only: [:new, :create, :index, :show]

  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.create!(event: @event)
    authorize @order
    @event.event_categories.each do |category|

      if params[:tickets_for].first.keys.include?(category.id.to_s)

        n_tickets = params[:tickets_for].first[category.id.to_s].to_i

        n_tickets.times do
          Ticket.create!(
            event_category: category,
            order: @order,
            is_used: false,
            )
        end
      end
    end

    if @order.save!
      redirect_to event_orders_path(@event.id), notice: 'Order successfully created.'
    else
      flash.now[:alert] = "Error: #{@order.errors.full_messages.join("\n")}"
      render :new
    end
  end

  private

  def orders_params
    params.require(:order).permit(:event_id, :client_id, :tickets_for)
  end

  def set_event
    @event = Event.find(params[:event_id])#.includes(:order)
  end
end
