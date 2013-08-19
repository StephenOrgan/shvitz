class AddTimeshiftToUser < ActiveRecord::Migration
  def change
    add_column :users, :timeshift, :string
  end
end
