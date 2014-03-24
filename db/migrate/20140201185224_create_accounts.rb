class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string  :subdomain
      
      # Account Details
      t.string  :company_name, :null => false
      # t.integer :account_type, :limit => 1, :default => 1
      
      # Company Locations
      t.string  :address
      t.string  :city
      t.string  :state
      t.integer :zipcode
      t.string  :country
      t.string  :work_phone
      t.string  :mobile_number   
      
      # Visibility
      t.integer :status, :limit => 3, :default => SettingsConfig::DISABLED
      t.userstamps
    end
  end
end