class OrganizationsController < ApplicationController
  before_action :fetch_organization, only: [:show, :edit, :update]

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
      redirect_to @organization, notice: 'Organization was sucessfully updated'
    else
      render 'edit'
    end
  end

  def index
    @organizations = policy_scope(Organization)
  end

  def show
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :website)
  end

  def fetch_organization
    @organization = Organization.find(params[:id])
    authorize @organization
  end

end
