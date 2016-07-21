class Addcreditemployment < ActiveRecord::Migration
  def change
         change_table :borrowers do |t| #t stands for table
      		t.integer :credit_score
	  		t.string :type_of_employment
	  		t.integer :length_of_employment
		end
	end
end
