require 'json'
class Corpus
	
	def self.look_up(look_up_query)
              json_text=File.read('corpus.json')
	      data=JSON.parse(json_text)
	      category=String.new
	      data.each do |key,value|
		    category=key if data[key].include? look_up_query 
	      end  
	      return category
	end 
end
