class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
    authorize @organization
  end

  def create
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end
end
