require 'sinatra' 
require 'json'
require 'net/http'
require 'uri'
require_relative './classifier'
require_relative './api_helper'

get '/' do 
	erb :index
end 


get '/query/:text' do 
   content_type :json
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
   query=construct_query(location,noun_phrases)
   print noun_phrases
   if category=='command'
   	json_response=exec_command(query)
   else 
   	json_response=APIHelper.call(query,category)
   end 
   	json_response.to_json

end

def construct_query(location,noun_phrases)
        if location.nil?
		 noun_phrases.sample
	else
		(location+noun_phrases).sample
	end

end 

def extract_nouns(data)
	return data['NP']
end 

def extract_location(data)
      return data['GPE']||data['LOCATION']
end 

def exec_command(query)
	to_open=query
 	return to_open	
end 
