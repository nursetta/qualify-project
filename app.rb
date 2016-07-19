class Qualify < Sinatra::Base
require 'json'
  # General route actions
  get '/' do
    erb :home
  end

  get '/borrower' do
  @borrowers = Borrower.all.to_json

  end

end