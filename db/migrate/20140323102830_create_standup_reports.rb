class CreateStandupReports < ActiveRecord::Migration
  def change
    create_table :standup_reports do |t|
      t.string  :task_name, :null => false, :limit => 100
      t.text    :description, :limit => 500
      t.string  :space_id
      t.integer :category_id
      t.integer :account_id
      t.integer :priority
      t.float   :eta
      t.float   :actual_time
      t.string  :comments
      t.integer :status, :limit => 3, :default => SettingsConfig::TASK_STATUS["Pending"]

      t.userstamps
      t.timestamps
    end
  end
end
