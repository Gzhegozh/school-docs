class AdminController < ApplicationController
  def set_admin
    @user = User.find(params[:user][:id])
    @school_group = SchoolGroup.find(params[:user][:school_group_id])
    prev_admin = User.with_role(:admin, @school_group).first
    prev_admin.remove_role :admin, @school_group
    @user.add_role(:admin, @school_group)
    flash[:success] = 'Successfully changed'
    redirect_to :back
  end
end
