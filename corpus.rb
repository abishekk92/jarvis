require 'json'
class Corpus
	
	def self.look_up(look_up_query)
              json_text=File.read('corpus.json')
	      data=JSON.parse(json_text) 
	      find_category(data,look_up_query)
	end 
	
	def self.find_category(data,look_up_query)
		keys=data.keys 
		category_found=false
	       	depth=0
		hash_set={}	
		until depth == keys.length or category_found
			if data[keys[depth]].include? look_up_query
				category_found=true
				hash_set={:category=>keys[depth],:query=>look_up_query}	
			else 
				depth=depth+1
			end
		end
		hash_set
	end
end

