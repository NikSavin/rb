require 'rack'
require 'rack/lobster'
=begin
class App
	def self.call(env)
	#	[200, { 'Content-Type' => 'text/plain' }, ['Hello World!']]
	#  [200, {'Content-Type' => 'text/html' }, ['Hello Ruby!']]
		header = { 'Content-Type' => 'text/html' }
		status = 200
		body = 'Hello Ruby!'
		unless env['PATH_INFO'] == '/'
			status = 404
			body = 'Not found'
		end
		header['Content-Length'] = body.length.to_s
		[status, header, [body]]
	end
end

run App
=end

# run proc{ |env| [ {'Content-Type' => 'text/plain'}, ['Hello Ruby!']] }
class MyMiddleWare
	def initialize(app)
		@app = app
	end

	def call(env)
		unless env['PATH_INFO'] == '/'
			return [400, { 'Content-tupe' => 'text/html'}, ['Not Found.']]
		end
		@app.call(env)
	end
end

map '/lobster' do 
	run Rack::Lobster.new
end

map '/static' do
  run Rack::File.new 'static'
end

use MyMiddleWare

run -> (env) do
	[200, {'Content-Type' => 'text/html'}, ['Hello Ruby!']]
end