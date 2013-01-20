require 'json'
class Corpus
  @value=''
  class << self
	  attr_accessor :value
  end 
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
		look_up_query=sanitize_query(look_up_query.downcase)
		#puts look_up_query
		until depth == keys.length or category_found
			if data[keys[depth]].include? look_up_query
				category_found=true
				@value=look_up_query
				hash_set={:category=>keys[depth]}	
			else 
				depth=depth+1
			end
		end
		hash_set
	end
	def self.sanitize_query(query)
		query.gsub(%r'\b(the|a|it|an|restaurant)','').strip
	end
end

