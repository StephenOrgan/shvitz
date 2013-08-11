class AddCreditToStudent < ActiveRecord::Migration
  def change
    add_column :students, :credit, :integer
  end
end
