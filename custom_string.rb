require_relative './corpus'
class String
	def is_weather?
		result=Corpus.look_up(self)
		result[:category]=='weather'
	end 

	def is_restaurant?
		result=Corpus.look_up(self)
		result[:category]=='restaurant'
	end 
	
	def is_cricket?
	       result=Corpus.look_up(self)
	       result[:category]=='cricket'
	end 
	
	def is_football?
		result=Corpus.look_up(self)
		result[:category]=='football'	
	end 
	
	def is_command?
		result=Corpus.look_up(self)
		result[:category]=='command' 
	end 
end

