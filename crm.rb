require_relative 'contact'
require 'sinatra'

get '/' do
  redirect to('/contacts')
end

get '/contacts' do
  @all_contacts = Contact.all
  erb(:contacts)
end

get '/add' do
  erb :add
end

get '/about' do
  erb(:about)
end

get '/contacts/:id' do
  @contact = Contact.find_by({id: params[:id].to_i})
  erb :show_contact
end

# Keep this line at the bottom
after do
  ActiveRecord::Base.connection.close
end
