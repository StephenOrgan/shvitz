class AddTimeshiftToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :timeshift, :string
  end
end
