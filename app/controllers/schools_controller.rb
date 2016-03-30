class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    if current_user.has_role? 'super_admin'
      if !params[:query].blank?
        @schools = School.search(params)
        render json: @schools
      else
        @schools = School.where(school_group_id: params[:school_group_id])
        render json: @schools
      end
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school_group = SchoolGroup.find(params[:school_group_id])
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
    @school_group = SchoolGroup.find(params[:school_group_id])
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to school_group_path(@school.school_group_id), notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to school_group_path(@school.school_group_id, @school.id), notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to school_group_path(@school.school_group_id), notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :school_group_id, :query)
    end
end
