require_relative 'contact'
require 'sinatra'

get '/' do
  erb(:index)
end

get '/contacts' do
  @all_contacts = Contact.all
  erb(:contacts)
end

get '/about' do
  erb(:about)
end

# Keep this line at the bottom
after do
  ActiveRecord::Base.connection.close
end
