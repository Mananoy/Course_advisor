class AddTeachingPeriodToCourseAdvice < ActiveRecord::Migration[6.1]
  def change
    add_column :course_advices, :teaching_period, :string
  end
end
