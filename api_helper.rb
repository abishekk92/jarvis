require 'open-uri'
require 'json'
require 'nokogiri'
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
		end_point="http://openweathermap.org/data/2.1/find/name?q=#{query}"
		result=JSON.parse open(end_point).read
		weather_data=result["list"].first
		{:type=>"weather",:main=>weather_data["main"],:wind=>weather_data["wind"],:clouds=>weather_data["clouds"],:gist=>weather_data["weather"],:external_url=>weather_data["url"]}		
	end 

	def zomato(location,query)
	     end_point="http://www.zomato.com/#{location}/restaurants/#{query}"
	     html_document=Nokogiri::HTML(open(end_point))
	     restaurants=html_document.css('h3.search-result-title a').collect{|search_result| search_result['title']}
	     	{:type=>"restaurants",:suggestions=>restaurants}
	end 	

	def cricinfo
		end_point="http://www.cricbuzz.com/scores-home"
		html_document=Nokogiri::HTML(open(end_point))
		score=html_document.css('div.cbz_pg_lft_content').first.css('div.schd_data_row').collect do |search_result|
			 search_result.css('div.schd_data').collect{ |news_item| news_item.content }

		end
		{:type=>"cricket_score",:result=>score}
	        	
	end 	

	def espn(query)

		 query

	end 

end 
api=APIHelper.new 
hash_set=api.cricinfo
print hash_set.to_json

