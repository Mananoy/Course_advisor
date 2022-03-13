class RenameTypeFromPrograms < ActiveRecord::Migration[6.1]
  def change
    rename_column :programs, :type, :course_type
  end
end
