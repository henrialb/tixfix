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
end
