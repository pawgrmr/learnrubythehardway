require './bin/app.rb'
require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def test_default
		get '/', :room => 'START'
		assert last_response.redirect? #302 status code = redirect
	end

	def test_get_room
		get '/game', params={:room => 'CENTRAL_CORRIDOR', :room => 'START'}
		assert last_response.ok? #200 status code = OK
	end

	def test_post
		post '/game', params={:action => 'tell a joke'}
		assert last_response.ok?
	end

end



	