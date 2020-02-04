require_relative( "../models/city.rb")
require_relative( "../models/country.rb")
require_relative( "../models/gastronomy.rb")
require("pry-byebug")


Gastronomy.delete_all()
Country.delete_all()
City.delete_all()

#COUNTRY_______________________________________________________

country1 = Country.new({
  "name" => "Scotland",
  "travelled" => true
  })
country1.save()

country2 = Country.new({
  "name" => "Ireland",
  "travelled" => true
  })
country2.save()

country3 = Country.new({
  "name" => "Spain",
  "travelled" => true
  })
country3.save()

country4 = Country.new({
  "name" => "Portugal",
  "travelled" => false
  })
country4.save()


#CITY ____________________________________________________

city1 = City.new({
  "name" => "Glasgow",
  "travelled" => true,
  "country_id" => country1.id
  })
city1.save()

city2 = City.new({
  "name" => "Inverness",
  "travelled" => false,
  "country_id" => country1.id
  })
city2.save()

city3 = City.new({
  "name" => "Barcelona",
  "travelled" => true,
  "country_id" => country3.id
  })
city3.save()

city4 = City.new({
  "name" => "Galway",
  "travelled" => true,
  "country_id" => country2.id
  })
city4.save()

city5 = City.new({
  "name" => "Lisbon",
  "travelled" => false,
  "country_id" => country4.id
  })
city5.save()

#Gastronomy_________________________________________________

gastronomy1 = Gastronomy.new({"name" => "Bitacora",
  "address" => "Carrer de Balboa, 1, 08003 Barcelona, Spain",
  "food" => "Seafood", "alcohol" => "Beers & Wine", "city_id" => city3.id})
gastronomy1.save()

gastronomy2 = Gastronomy.new({"name" =>"The Chili Shack",
  "address" => "19 Abbeygate Street Upper, Galway, H91 N2P1, Ireland",
  "food" => "Mexican/American food", "alcohol" => "Beer", "city_id" => city4.id})
gastronomy2.save()

gastronomy3 = Gastronomy.new({"name" =>"Kurdish Street Food",
  "address" => "12-14 Allison St, Glasgow, G42 8NN",
  "food" => "Middle Eastern", "alcohol" => "None", "city_id" => city1.id})
gastronomy3.save()

gastronomy4 = Gastronomy.new({"name" => "La Tasca Del Corral",
  "address" => "Carrer de la Mercè, 17, 08002 Barcelona, Spain",
  "food" => "Spanish/Med", "alcohol" => "Beer, Vermut, & Wine", "city_id" => city3.id})
gastronomy4.save()

binding.pry
nil
