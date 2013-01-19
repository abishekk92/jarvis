require_relative './corpus'
class String
	def is_weather?
		result=Corpus.look_up(self)
		if result=='weather'
			return true
		else 
			return false
		end
	end 	

	def is_restaurant?
		result=Corpus.look_up(self)
		if result=='restaurant'
			return true
		else 
			return false 
        	end 
	end 
	
	def is_cricket?
	       result=Corpus.look_up(self)
	       if result=='cricket'
		       return true 
	       else 
		       return false
	       end 
	end 
	
	def is_football?
		result=Corpus.look_up(self)
		if result=='football'
			return true
		else 
			return false 
		end 	
	end 
	
	def is_command?
		result=Corpus.look_up(self)
		if result=='command'
			return true 
	        else
			return false 
		end 
	end 
end

