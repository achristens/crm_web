require_relative 'contact'
require 'sinatra'
require 'pry'

get '/' do
  redirect to('/contacts')
end

get '/contacts' do
  @all_contacts = Contact.all
  erb(:contacts)
end

get '/contacts/new' do
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

post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
end

get '/contacts/:id/edit' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

get '/search' do
  erb :search
end

get '/search_results' do

  # name = params.values.first
  if params["search"]
    if [] != @contacts = Contact.where(first_name: params["search"])
      erb :search_results
    else @contacts = Contact.where(last_name: params["search"])
      erb :search_results
    end
  else
    erb :contacts
  end
end

# Keep this line at the bottom
after do
  ActiveRecord::Base.connection.close
end


# When you've searched for something the word "search becomes tehkey to a hash and the thing you searched becomes the value"
# name = params.values.first
# @contacts = Contact.where(first_name: name)
