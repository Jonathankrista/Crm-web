
require 'sinatra'
require_relative 'contact'

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
	puts params
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end



