require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do 
	return 'Hello World'
end

get '/hello/' do #created a different handler to return a form
	erb :hello_form
end

get '/hello/' do #handler specifies what happens when browser goes to /hello/
	greeting = params[:greeting] || "Hi There" #In the handler we get the ?greeting=Hi by using params hashmap
	#this is a way of saying either use whats in params or use 'Hi There' 
	erb :index, :locals => {'greeting' => greeting, 'name' => name}
	#handler calls erb function to 'render' the :index view. 
	#Also give this greet view(i.e. views/index.erb file) the local variables greeting with this setting 
	#(i.e. Sinatra passes in the greeting variable).
end

post '/hello/' do #Post handler to indicate we will be receiving a form 
	greeting = params[:greeting] || "Hi There"
	name = params[:name] || "Nobody" #accept name parameter

	erb :index, :locals => {'greeting' => greeting, 'name' => name}
end
