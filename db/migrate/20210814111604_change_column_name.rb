class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :staffs, :pass, :password
    rename_column :students, :pass, :password
  end
end
