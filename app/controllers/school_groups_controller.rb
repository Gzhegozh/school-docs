class SchoolGroupsController < ApplicationController
  before_action :set_school_group, only: [:show, :edit, :update, :destroy]

  # GET /school_groups
  # GET /school_groups.json
  def index
    if current_user.has_role? 'super_admin'
      @school_groups = SchoolGroup.all
    else
      @school_groups = SchoolGroup.with_role('admin', current_user)
    end
  end

  # GET /school_groups/1
  # GET /school_groups/1.json
  def show
    @admin = User.with_role(:admin, @school_group)
  end

  # GET /school_groups/new
  def new
    @school_group = SchoolGroup.new
  end

  # GET /school_groups/1/edit
  def edit
    @users = User.all
  end

  # POST /school_groups
  # POST /school_groups.json
  def create
    @school_group = SchoolGroup.new(school_group_params)

    respond_to do |format|
      if @school_group.save
        format.html { redirect_to @school_group, notice: 'School group was successfully created.' }
        format.json { render :show, status: :created, location: @school_group }
      else
        format.html { render :new }
        format.json { render json: @school_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_groups/1
  # PATCH/PUT /school_groups/1.json
  def update
    respond_to do |format|
      if @school_group.update(school_group_params)
        format.html { redirect_to @school_group, notice: 'School group was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_group }
      else
        format.html { render :edit }
        format.json { render json: @school_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_groups/1
  # DELETE /school_groups/1.json
  def destroy
    @school_group.destroy
    respond_to do |format|
      format.html { redirect_to @school_group, notice: 'School group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_group
      @school_group = SchoolGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_group_params
      params.require(:school_group).permit(:name)
    end
end
