class AddColMemberIdsGroup < ActiveRecord::Migration
  def change
    add_column :groups, :member_ids, :text, :null => true
  end
end
