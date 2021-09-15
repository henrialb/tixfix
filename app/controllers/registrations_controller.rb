class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      name = "#{user.name}'s Organization"
      user.create_organization(name: name)

      unless user.save
        flash.now[:alert] = "Error: #{user.errors.full_messages.join("\n")}"
      end
    end
  end

  def new_user_organization
    @user = User.new
    @organization = Organization.find(params[:organization_id])
  end

  def create_new_user_organization
    @user = User.new(user_params)
    @user.organization = Organization.find(params[:organization_id])
    if @user.save
      redirect_to root_path
    else
      render :create_new_user_organization
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
