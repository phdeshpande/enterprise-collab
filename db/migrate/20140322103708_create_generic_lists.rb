class CreateGenericLists < ActiveRecord::Migration
  def change
    create_table :generic_lists do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :account_id

      t.timestamps
    end
  end
end
