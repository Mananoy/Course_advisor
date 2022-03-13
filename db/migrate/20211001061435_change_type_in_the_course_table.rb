class ChangeTypeInTheCourseTable < ActiveRecord::Migration[6.1]
  def change
    change_column :courses, :course_ID, :string
  end
end
