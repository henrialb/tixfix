class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update]
  def new
    @client = Client.new
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    @clients.organization = current_organization
    authorize @client

    if @client.save
      redirect_to clients_path, notice: 'client was successfully created.'
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
