class ClientsController < ApplicationController
  def new
    @client = Client.new
    authorize @client
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end
end
