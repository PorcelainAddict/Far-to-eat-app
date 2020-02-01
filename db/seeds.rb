require_relative( "../models/city.rb")
require_relative( "../models/countries.rb")
require_relative( "../models/gastronomy.rb")
require("pry-byebug")


country1 = Country.new({
  "name" => "Scotland",
  "travelled" => "True"
  })
country1.save()

country2 = Country.new({
  "name" => "Ireland",
  "travelled" => "True"
  })
country2.save()

country3 = Country.new({
  "name" => "Spain",
  "travelled" => "True"
  })
country3.save()

country4 = Country.new({
  "name" => "Portugal",
  "travelled" => "False"
  })
  country4.save()

city1 = City.new({
  "name" => "Glasgow",

  })
