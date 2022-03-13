class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :program
      t.string :plan
      t.integer :course_ID
      t.string :type
      t.integer :group

      t.timestamps
    end
  end
end
