class AddDegreeYearToCourseAdvice < ActiveRecord::Migration[6.1]
  def change
    add_column :course_advices, :degree_year, :integer
  end
end
