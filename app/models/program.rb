class Program < ApplicationRecord

  def self.list_program_courses(courses_type, course_IDs=["1556","21221"], filterByTerm = true, plan: "A", year: , teaching_period:)

    @courses_list = []

    course_IDs.each do |course_ID|
      if filterByTerm
        @p_courses = Program.where(plan: plan, course_type: courses_type)
      else
        @p_courses = Program.where(course_ID: course_ID, course_type: courses_type)
      end

      @p_courses.each do |p_course|

        @year = (p_course.group / 100)

        @courses = Course.where(course_ID: p_course.course_ID )
        @courses.each do |course|

          @teaching_period_no = course.term % 100
          @teaching_period = Course.get_teaching_period(@teaching_period_no)

          if (@year == year.to_i) && (@teaching_period == teaching_period) && (!(@courses_list.include? course))
            @courses_list.push(course)
          end

        end
      end
    end
    @courses_list
  end

end
