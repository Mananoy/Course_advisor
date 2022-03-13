class StudentsController < ApplicationController
  before_action :user_identify
  # account: a1713245 password: secret

  def dashboard
    # student profile
  end

  def enrolments
    @enrolments=Enrolment.where(student_ID: current_user.account)
    @courses=Course.all
  end

  def advice
    # divert into different form
  end

  def new_student
    # form fo new student
  end

  def continue_student
    # form fo continue student
  end

  def form_submit
    if params.has_key?(:new_or_continue)
      if params[:new_or_continue] == "No"
        redirect_to '/system/students/request_advice/continue_student'
        return
      elsif params[:new_or_continue] == "Yes"
        redirect_to '/system/students/request_advice/new_student'
        return
      end
    end
  end

  def history
    # view at moment, wait for model
    @user = current_user.account
    @advices = CourseAdvice.where(student_ID: @user)
  end

  def help
    # just for help
  end

  def show
    # for showing detail of each advice
    @id = params[:advice_id] || session[:id]
    @advices = CourseAdvice.where(advice_ID: @id)

    @advices.each do |advice|
      if advice.student_ID != current_user.account
        redirect_to "/system/students/advice_history", :alert => "You have no permission to view this resource"
      end
    end

    if params[:advice_id]
      session[:id] = params[:advice_id]
    end

    @advices.each do |advice|
      @a_ID = advice.advice_ID
      @date = advice.date
      @note = advice.note

      @s_ID = advice.student_ID

      @year = advice.degree_year
      @teaching_period = advice.teaching_period

      raw_course_IDs = advice.course_ID
      @course_IDs = YAML.load(raw_course_IDs.delete': ')
    end

    @selected_core_courses = Program.list_program_courses("core", @course_IDs, false, year: @year,teaching_period: @teaching_period)
    @selected_electives = Program.list_program_courses("elective", @course_IDs, false, year: @year,teaching_period: @teaching_period)

  end

  def edit
    @student = current_user.account
    respond_to do |format|
      format.html {render :edit, locals: { student: @student} }
    end
  end

  def update
    student = current_user
    @student = current_user.account
    respond_to do |format|
      format.html do
        if student.update(params.require(@student).permit(:expected_completion))
          flash[:success] = 'Expected completion updated successfully'
          redirect_to system_students_path
        else
          flash.now[:error] = "Error updating expected completion"
          render :edit, locals: { student: student}
        end
      end
    end
  end

  def result

    @selected_core_courses = []
    @selected_electives = []

    if params.has_key?(:year) && params.has_key?(:teaching_period)

      @selected_core_courses = Program.list_program_courses( "core",plan: current_user.plan,year: params[:year],teaching_period: params[:teaching_period])
      @selected_electives = Program.list_program_courses( "elective",plan: current_user.plan,year: params[:year],teaching_period: params[:teaching_period])

      @selected_courses = @selected_core_courses + @selected_electives

      CourseAdvice.save_advice_details(current_user.account, @selected_courses, params[:year], params[:teaching_period])

    end

  end

  private
    def user_identify
      if current_user.is_a?(Student)
        # it's an instance of student
      else
        redirect_to root_url, :alert => "You must login as student to view this resource"
      end
    end
  end
