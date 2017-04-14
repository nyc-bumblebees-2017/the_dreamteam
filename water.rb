require 'JSON'
require 'open-uri'

data = open('https://data.cityofnewyork.us/resource/waf7-5gvc.json').string

parsed_data = JSON.parse(data)

puts "How many years have you lived in NYC?"
years_in_nyc = gets.chomp.to_i

personal_water_spent = 0
city_water_spent = 0
years_in_nyc.times do |index|
  personal_water_spent += (parsed_data[index]["per_capita_gallons_per_person_per_day"]).to_i * 365
  city_water_spent += (parsed_data[index]["nyc_consumption_million_gallons_per_day"]).to_i * 365
end

puts "You've spent about #{personal_water_spent} gallons of water since you've been in NYC!"

puts "And the city has spent about #{city_water_spent} millions of gallons of water since you've been in NYC!"
