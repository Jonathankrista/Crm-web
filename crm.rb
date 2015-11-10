
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")


class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String
end

DataMapper.finalize
DataMapper.auto_upgrade!


get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts/delete' do
	erb :delete_contact
end

get "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
  	erb :show_contact
  else
  	raise Sinatra::NotFound
  end
end

get "/contacts/:id/edit" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact then
    @contact.update(
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :note => params[:note])
    redirect to("/contacts/#{@contact.id}")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.destroy
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end



post "/contacts" do
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note])

  redirect to('/contacts')
end




# require 'sinatra'
#   DataMapper.setup(:default, 'sqlite:crm_development.db')


# class Contact
#   include Datamapper::Resource
#   # will figure this out to mean 'contacts' table i
#   perperty :id, Serial
#   property :first_name, String
#   property :last_name, String
#   perperty :email, String
#   peoperty :note, Text
# end

# DataMapper.auto.method!

# gets '/contacts ' do
#   @contacts = contact.all




