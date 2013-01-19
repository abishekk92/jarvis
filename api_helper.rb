class APIHelper

	def self.call(query,category)
   
	 	case category
		when /weather/
			 accu_weather(query)
		when /restaurant/
			 zomato(query)
		when /cricket/
			 cricinfo(query)
		when /football/
			 espn(query)
				
	    end 
	end

 	def accu_weather(query)
		 query

	end 

	def zomato(query)
		 query

	end 	

	def cricinfo(query)
		 query

	end 

	def espn(query)

		 query

	end 

end 
