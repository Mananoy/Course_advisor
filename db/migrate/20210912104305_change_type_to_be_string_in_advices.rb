class ChangeTypeToBeStringInAdvices < ActiveRecord::Migration[6.1]
  def change
    change_column :course_advices, :student_ID, :string
    change_column :course_advices, :course_ID, :string
    change_column :programs, :course_ID, :string
    change_column :enrolments, :course_ID, :string
  end
end
