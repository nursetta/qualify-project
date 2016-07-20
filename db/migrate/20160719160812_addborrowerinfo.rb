class Addborrowerinfo < ActiveRecord::Migration
  def change
        change_table :borrowers do |t| #t stands for table
      t.string :income
	  	t.integer :base_monthly_income
	  	t.integer :bonus_monthly_income
	  	t.integer :commision_monthly_income
	  	t.integer :net_rental_income
	  t.string :expenses
	  	t.integer :rent
	  	t.integer :mortgage_payment_monthly
	  	t.integer :credit_card_payments
	  	t.integer :auto_loan_payments
	  	t.integer :installment_loan_payments
	  t.string :new_mortgage_information
	  	t.integer :home_price
	  	t.integer :loan_amount
	  	t.integer :interest_rate
	  	t.integer :monthly_pi
	  	t.integer :monthly_ti
	  	t.integer :monthly_hoa
	  	t.integer :total_monthly_payment
    end
  end
end
