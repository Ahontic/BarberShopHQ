#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:barbershop.db"
class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end
before do
	@barbers = Barber.all
end

get '/' do
		
	erb :index
end

get "/visit" do
	erb :visit
end

post '/visit' do
		# user_name, phone, date_time
		@username 	= params[:username]
		@phone 		= params[:phone]
		@datestamp 	= params[:datestamp]
		@barber		= params[:barber]
		@color		= params[:color]

		# Сохранение в БД ламерский способ

# client = Client.new
# client.name      = @username
# client.phone     = @phone
# client.datestamp = @datetime
# client.barber    = @barber
# client.color     = @color
# client.save

c = Client.new params[:client]
c.save
		
		erb "<h2> Спасибо, Вы записались!</h2>"
		
end