class AddRecurToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :recur, :integer
  end
end
