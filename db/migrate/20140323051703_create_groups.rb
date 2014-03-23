class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string  :name, :limit => 50, :null => false
      t.string  :description, :limit => 100
      t.integer :user_id
      t.integer :account_id
      t.integer :status, :limit => 3, :default => SettingsConfig::DISABLED
      
      t.userstamps
      t.timestamps
    end
  end
end
