require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
get '/' do 

erb :index
end 


get '/query/:text' do 

   puts "Querying #{params[:text]}"
   uri=URI.parse("http://text-processing.com/")
   http=Net::HTTP.new(uri.host,uri.port)
   request=Net::HTTP::Post.new("/api/phrases/")
   request.add_field('Content-Type','application/json')
   request.body=params[:text].to_s
   response=http.request(request)
   json_response= response.body
   print json_response
   

end


