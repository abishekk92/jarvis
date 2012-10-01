require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
get '/' do 

erb :index
end 


get '/query/:text' do 

   puts "Querying #{params[:text]}"
   uri=URI("http://text-processing.com/")
   http=Net::HTTP.new(uri.host,uri.port)
   request=Net::HTTP::Post.new("/api/phrases/")
   request.add_field('Content-Type','application/json')
   request.body="text=#{params[:text]}"
   response=http.request(request)
   json_response= response.body
   data=JSON.parse(json_response)
   person=data['PERSON']
   noun=data['NP']
   location=data['LOCATION']
   gpe=data['GPE']
   unless person.empty?
       results=query(person)
   end
end 
def query(person)
    puts person
end 

