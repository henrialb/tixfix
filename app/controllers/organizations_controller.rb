class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit update]

  def new
  end

  def create
  end

  def edit
    set_organization
  end

  def update
    set_organization
    if @organization.update(organization_params)
      authorize @organization
      redirect_to @organization, notice: 'Organization was sucessfully updated'
    else
      render :edit
    end
  end

  def index
    @organizations = policy_scope(Organization)
  end

  def show
    set_organization
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :website)
  end

  def set_organization
    @organization = Organization.find(params[:id])
    authorize @organization
  end
end
