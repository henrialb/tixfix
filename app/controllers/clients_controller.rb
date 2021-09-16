class ClientsController < ApplicationController
  before_action :set_client, only: %i[show]

  def new
  end

  def create
    @order = params[:order_id]
    @event = @order.event
    @client = Client.new(client_params)
    authorize @client

    if @client.save
      redirect_to event_order_path(@event.id, @order.id), notice: 'client was successfully created.'
    else
      render :new
    end
  end

  def index
    @clients = policy_scope(Client)
  end

  def show
    set_client
  end

  def edit
    @order = Order.find(params[:order_id])
    @client = @order.client
      authorize @client
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
    authorize @client
  end

  def client_params
    params.require(:client).permit(:name, :email, :phone)
  end
end
