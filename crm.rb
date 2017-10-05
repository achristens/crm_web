require_relative 'contact'
require 'sinatra'

get '/' do
  redirect to('/contacts')
end

get '/contacts' do
  @all_contacts = Contact.all
  erb(:contacts)
end

get '/new' do
  erb :new
end

get '/about' do
  erb(:about)
end

get '/contacts/:id' do
  @contact = Contact.find_by({id: params[:id].to_i})

  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

# Keep this line at the bottom
after do
  ActiveRecord::Base.connection.close
end
