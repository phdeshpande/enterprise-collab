class AddStatusToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :status, :integer
  end
end
