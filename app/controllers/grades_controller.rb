class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy, :choose_students, :add_student, :delete_student]
  before_action :set_school, only: [:new, :create, :update, :destroy]
  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    @students = User.includes(:profile).where(id: @grade.users)
  end

  # GET /grades/new
  def new
    @grade = @school.grades.new
    @grade.build_enrollment_form
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = @school.grades.new(grade_params)
    @enrollment_form = @grade.build_enrollment_form
    @enrollment_form.save
    @sections = params[:sections]
    @sections.each do |section|
      @enrollment_form.enrollment_form_sections << EnrollmentFormSection.find(section)
    end

    respond_to do |format|
      if @grade.save
        format.html { redirect_to [@school.school_group, @school], notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    @enrollment_form = @grade.build_enrollment_form
    @sections = params[:sections]
    @enrollment_form.enrollment_form_sections.clear
    @sections.each do |section|
      @enrollment_form.enrollment_form_sections << EnrollmentFormSection.find(section)
    end
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to [@school.school_group, @school], notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to [@school.school_group, @school], notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def choose_students
    @students = User.includes(:profile).includes(:enrollments).with_role('student').paginate(:page => params[:page], :per_page => 5)
  end

  def add_student
    if current_user.has_role?('admin', @grade) || current_user.has_role?('super_admin')
      @student = User.find(params[:student_id])
      unless @grade.users.exists? @student
        @grade.users << @student
      end
    end
    render :json => {status: :ok}
  end

  def delete_student
    if current_user.has_role?('admin', @grade) || current_user.has_role?('super_admin')
      @student = User.find(params[:student_id])
      @grade.enrollments.where(user: @student).first.destroy
    end
    render :json => {status: :ok}
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end
    def set_school
      @school = School.find(params[:school_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:name, :description, :certificate_template_path, :school_id)
    end
end
