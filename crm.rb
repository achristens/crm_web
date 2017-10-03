require_relative 'contact'
require 'sinatra'

get '/' do
  erb(:index)
end

get '/contacts' do
  erb(:contacts)
end



# Keep this line at the bottom
after do
  ActiveRecord::Base.connection.close
end
