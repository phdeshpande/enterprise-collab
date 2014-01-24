class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	      t.string :username
       t.string :email  
		t.string :password
		t.string :confirmpassword
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :request
      t.boolean :subscription
      t.boolean :terms
    end
end
  
end
