class AddColActivationKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :activation_key, :string
  end
end
