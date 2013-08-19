class AddStudentIdToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :student_id, :integer
  end
end
