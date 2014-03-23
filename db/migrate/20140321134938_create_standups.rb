class CreateStandups < ActiveRecord::Migration
  def change
    create_table :standups do |t|
      t.string :task_name,:null => false
      t.integer :space_id
      t.time :eta
      t.time :actual_time
      t.integer :category_id
      t.integer :status
      t.text :comments
      t.integer :account_id
      t.userstamps
      t.timestamps
    end
  end
end
