require 'json'
class Corpus
	
	def self.look_up(look_up_query)
              json_text=File.read('corpus.json')
	      data=JSON.parse(json_text)
	      data.each do |key,value|
		      {:category=>key,:value=>look_up_query} if data[key].include? look_up_query 
	      end  
	end 
end
