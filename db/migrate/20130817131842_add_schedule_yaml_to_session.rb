class AddScheduleYamlToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :schedule_yaml, :string
  end
end
