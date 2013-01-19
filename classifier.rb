require_relative './custom_string'
class Classifier 
	def self.classify_category(noun_phrases)
	     noun_phrases.each do |noun_phrase| 
		   if noun_phrase.is_weather?
			   return 'weather' 
		   elsif noun_phrase.is_restaurant?
			   return 'restuarant'
		   elsif noun_phrase.is_cricket?
			   return 'cricket'
	           elsif noun_phrase.is_football?
			   return 'football'
		   elsif noun_phrase.is_command?
			   return 'command'
		   end
		end 
	end 
end 

