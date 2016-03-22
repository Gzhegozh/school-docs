class AdminController < ApplicationController
  def set_admin
    @user = User.find(params[:user][:id])
    @school_group = SchoolGroup.find(params[:user][:school_group_id])
    @user.add_role(:admin, @school_group)
    redirect_to :back
  end
end
