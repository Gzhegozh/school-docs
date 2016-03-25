class HomeController < ApplicationController
  def index
    if current_user.has_role? "super_admin"
      redirect_to school_groups_path
    end
    if current_user.has_role? "admin"
      redirect_to school_groups_path
    end

  end
end
