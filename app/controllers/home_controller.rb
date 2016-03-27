class HomeController < ApplicationController
  def index
    if current_user.has_role? "super_admin"
      redirect_to school_groups_path
    elsif SchoolGroup.with_role('admin', current_user).to_a.size > 0
      #@group = SchoolGroup.with_role('admin', current_user).first
      #redirect_to school_group_path(@group)
      redirect_to school_groups_path
    end

  end
end
