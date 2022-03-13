class CreateCourseAdvices < ActiveRecord::Migration[6.1]
  def change
    create_table :course_advices do |t|
      t.integer :advice_ID
      t.integer :student_ID
      t.integer :course_ID
      t.text :note
      t.date :date

      t.timestamps
    end
  end
end
