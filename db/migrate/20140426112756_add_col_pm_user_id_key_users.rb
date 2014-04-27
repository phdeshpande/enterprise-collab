class AddColPmUserIdKeyUsers < ActiveRecord::Migration
  def change
    add_column :users, :pm_user_id_key, :string
  end
end
