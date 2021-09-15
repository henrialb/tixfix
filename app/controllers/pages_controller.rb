class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def change_validation
    current_user.is_validation = !current_user.is_validation
    current_user.save
    redirect_back(fallback_location: root_path)
  end
end
