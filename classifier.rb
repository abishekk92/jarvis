require_relative './custom_string'
class Classifier 
	def self.classify_category(noun_phrases)
	     classified_category=''
	     depth=0
	     classified=false 
	     until depth == noun_phrases.length or classified
		   if noun_phrases[depth].is_weather?
			   classified_category='weather'
			   classified=true 
		   elsif noun_phrases[depth].is_restaurant?
			   classified_category='restuarant'
			   classified=true 
		   elsif noun_phrases[depth].is_cricket?
			   classified_category='cricket'
			   classified=true
	           elsif noun_phrases[depth].is_football?
			   classified_category='football'
			   classified=true
		   elsif noun_phrases[depth].is_command?
			   classified_category='command'
			   classified=true
		   else
			   depth=depth+1
		end 
	    end 
	    classified_category
	end
end 

