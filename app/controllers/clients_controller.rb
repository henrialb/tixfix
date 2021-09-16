class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]

  def new
  end

  def create
    # @order = params[:order_id]
    # @event = @order.event
    # @client = Client.new(client_params)
    # authorize @client

    # if @client.save
    #   redirect_to event_order_path(@event.id, @order.id), notice: 'Client successfully created.'
    # else
    #   render :new
    # end
  end

  def index
    @clients = policy_scope(Client)
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to event_order_path(@client.order.event.id, @client.order.id), notice: 'Tix sent. Client successfully updated.'
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
