class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, :null => false
    add_column :users, :last_name, :string, :null => false
    add_column :users, :dob, :date
    add_column :users, :mobile_number, :string, :limit => 25
    add_column :users, :work_number, :string, :limit => 25
    add_column :users, :residence_address, :string
    add_column :users, :sex, :integer, :limit => 3
  end
end
