class AddTerm < ActiveRecord::Migration
  def change
           change_table :borrowers do |t| #t stands for table
      		t.integer :term
		end
  end
end
