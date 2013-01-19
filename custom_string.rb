require_relative './corpus'
class String
	def is_weather?
		result=Corpus.look_up(self)
		result=='weather'
	end 	

	def is_restaurant?
		result=Corpus.look_up(self)
		result=='restaurant'
	end 
	
	def is_cricket?
	       result=Corpus.look_up(self)
	       result=='cricket'
	end 
	
	def is_football?
		result=Corpus.look_up(self)
		result=='football'	
	end 
	
	def is_command?
		result=Corpus.look_up(self)
		result=='command' 
	end 
end

