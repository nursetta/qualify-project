class CreateBorrowers < ActiveRecord::Migration
  def change
      create_table :borrowers do |t| #t stands for table
      t.string :name #add a name attribute of type string to the table
      t.string :address #also add a photo_url attribute of type string
      t.string :phone_number
      t.string :email # finally add a nationality attribute of type string
      t.timestamps null:true #this will add timestamps for time created and time updated automagically!
    end
  end
end
