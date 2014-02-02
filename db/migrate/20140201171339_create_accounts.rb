class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :company
      t.string :subdomain
      t.text :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :office
      t.string :mobile
      t.string :status
      t.timestamps
    end
  end
end
