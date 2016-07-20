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
    if total_income < 10000
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