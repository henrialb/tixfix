class OrganizationsController < ApplicationController
  before_action :find_organization, only: [:show, :edit, :update, :index]

  def new
  end

  def create
  end

  def edit
    @organization = Organization.find(params[:id])
    authorize @organization
  end

  def update
    if @organization.update(user_params)
      authorize @organization
      redirect_to @organization
    else
      render 'edit'
    end
  end

  def index
  end

  def show
    @organizations = Organization.all
    authorize @organizations
  end

  private

  def user_params
    params.require(:organization).permit(:name, :website)
  end

  def find_organization
    @organization = Organization.find(params[:id])
  end

end
