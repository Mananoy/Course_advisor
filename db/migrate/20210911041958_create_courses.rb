class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.integer :course_ID
      t.string :name
      t.string :subject_area
      t.integer :catalogue
      t.string :prerequisite
      t.string :corequisite
      t.string :assumed_knowledge
      t.text :description
      t.integer :unit
      t.text :restriction
      t.integer :pass_rate
      t.integer :term

      t.timestamps
    end
  end
end
