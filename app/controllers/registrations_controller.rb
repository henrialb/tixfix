class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      name = "#{user.name}'s Organization"
      user.create_organization(name: name)
    end
  end
end
