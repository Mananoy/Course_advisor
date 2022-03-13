class CourseAdvice < ApplicationRecord

  def self.save_advice_details(student_ID, selected_courses, year, teaching_period)

    @a_id = Time.now.getutc
    @c_id = []
    selected_courses.each do |selected_course|
      @c_id.push(selected_course.course_ID)
    end

    @note = "NA"
    @date = Time.now.getutc

    CourseAdvice.create(advice_ID:@a_id, student_ID: student_ID, course_ID:@c_id, note:@note, date:@date, degree_year:year, teaching_period: teaching_period)

  end

end
