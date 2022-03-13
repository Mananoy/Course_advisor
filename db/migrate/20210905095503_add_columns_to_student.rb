class AddColumnsToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :name, :string
    add_column :students, :residency, :string
    add_column :students, :qualification, :string
    add_column :students, :program, :string
    add_column :students, :plan, :string
    add_column :students, :year, :integer
    add_column :students, :expected_completion, :string
    add_column :students, :english_exam, :string
    add_column :students, :english_score, :decimal
  end
end
