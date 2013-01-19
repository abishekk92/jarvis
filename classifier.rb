require_relative './custom_string'
class Classifier 
	def self.classify_category(noun_phrases)
	     classified_category=[]
	     noun_phrases.each do |noun_phrase| 
		   if noun_phrase.is_weather?
			   classified_category<<'weather' 
		   elsif noun_phrase.is_restaurant?
			   classified_category<<'restuarant'
		   elsif noun_phrase.is_cricket?
			   classified_category<<'cricket'
	           elsif noun_phrase.is_football?
			   classified_category<<'football'
		   elsif noun_phrase.is_command?
			   classified_category<<'command'
		   end
		end 
	      classified_category
	end 
end

