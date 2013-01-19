require 'sinatra' 
require 'json'
require 'net/http'
require 'uri'
require_relative './classifier'

get '/' do 
	erb :index
end 


get '/query/:text' do 

   puts "Querying:#{params[:text]}"
   uri=URI("http://text-processing.com/")
   http=Net::HTTP.new(uri.host,uri.port)
   request=Net::HTTP::Post.new("/api/phrases/")
   request.add_field('Content-Type','application/json')
   request.body="text=#{params[:text]}"
   response=http.request(request)
   json_response= response.body
   data=JSON.parse(json_response)
   noun_phrases=extract_nouns(data)
   location=extract_location(data)
   category=Classifier.classify_category(noun_phrases)
   print category
end

def extract_nouns(data)
	return data['NP']
end 

def extract_location(data)
      return data['GPE']||data['LOCATION']
end 

