class CreateEnrolments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrolments do |t|
      t.string :student_ID
      t.integer :course_ID
      t.integer :term
      t.integer :marks

      t.timestamps
    end
  end
end
