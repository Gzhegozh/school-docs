class UsersController < ApplicationController
  def index
    query = "#{params[:q]}"
    @users = User.search(params=query)
    render :json => @users.map(&:email)

  end
end