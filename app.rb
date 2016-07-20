class Qualify < Sinatra::Base
require 'json'
set :method_override, true

  # GET route takes you to the home page of the app.
  get '/' do
    erb :home
  end

  # SHOW route displays all of the borrowers/profiles that have been created.
  get '/borrowers' do
    @borrowers = Borrower.all
    erb :allborrowers
  end

  get '/borrowers/qualify/:id' do
    borrower = Borrower.find(params[:id])
      base_income = borrower.base_monthly_income
      bonus_income = borrower.bonus_monthly_income
      commision_income = borrower.commision_monthly_income
      rental_income = borrower.net_rental_income
      total_income = base_income + bonus_income + commision_income + rental_income
      p total_income

      rent_expense = borrower.rent
      mortgage_expense = borrower.mortgage_payment_monthly
      credit_card_expense = borrower.credit_card_payments
      auto_expense = borrower.auto_loan_payments
      installment_expense = borrower.installment_loan_payments
      total_debt = rent_expense + mortgage_expense + credit_card_expense + auto_expense + installment_expense
      p total_debt
      
      home_price = borrower.home_price
      loan_amount = borrower.loan_amount
      interest_rate = borrower.interest_rate
      pi = borrower.monthly_pi
      ti = borrower.monthly_ti
      hoa = borrower.monthly_hoa
      total_mortgage_payment = pi + ti + hoa
      p total_mortgage_payment   
 
      dti = (((total_debt.to_f) - rent_expense - mortgage_expense) + total_mortgage_payment) / total_income.to_f
      p dti

      ltv = loan_amount.to_f / home_price.to_f
      p ltv
 
    if dti > 0.45 || ltv > 0.9
      "Sorry You dont Qualify"
    else
      "Congrats! You Qualify!"  
end
  end

# GET route sends you to a page where a user can enter thier info to create a borrower
	get '/create' do
		erb :createborrower
	end

  # POST route sends all of the data from the create form to the PSQL and then
  # redirects you to the all borrowers page
  post '/create' do
    request.body.rewind
    form_data = URI::decode_www_form(request.body.read).to_h
    p form_data
    @new_borrower = Borrower.create form_data
    redirect to ('/borrowers')
  end
 
  # DELETE route will delete the entire borrower that is selected
  delete '/borrowers/:id' do
    @borrower_to_delete = Borrower.find(params[:id])
    @borrower_to_delete.destroy
      redirect('/borrowers')
  end  

  # EDIT route will send you to the edit borrower form where you will see all of the info
  # that you have input and allow you to change those fields.
  # Once you hit the save button at the bottom of the page, the update route kicks in.
  get '/borrowers/:id/edit' do
    @borrower_to_edit = Borrower.find(params[:id])
    erb :editborrower
  end

  # UPDATE route will update the fields you just edited and store that new info in the database.
  put '/borrowers/:id' do
    request.body.rewind
    form_data = URI::decode_www_form(request.body.read).to_h
    @borrower_to_update = Borrower.find(params[:id])
    if @borrower_to_update.update_attributes form_data.except("_method")
      redirect('/borrowers')
    else
        erb :allborrowers
    end
  end
end