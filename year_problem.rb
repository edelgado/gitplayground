# Five sample bith and end years
lifespans = [
  (1930..1985), 
  (1977..2077), 
  (1940..2020), 
  (2016..2098), 
  (1921..2001)
]

first_year = lifespans.map(&:min).min
last_year = lifespans.map(&:max).max

# Generate a hash for each of the possible years, with the year as the key and
# the number of people alive in that year as the value.
people_alive_by_year = {}
(first_year..last_year).to_a.each do |year| 
  people_alive_by_year[year] = lifespans.count{ |lifespan| lifespan.cover? year} 
end

# Figure out the maximum number of people alive across all years:
most_alive_per_year = people_alive_by_year.values.max
# Figure out which years had the maximum number of people alive:
years_with_most_people_alive = people_alive_by_year.select{|year,count| count == most_alive_per_year}.keys

puts "The record for most people alive for a given year is #{most_alive_per_year} in the years of #{years_with_most_people_alive.join(', ')}"

# Prints: The record for most people alive for a given year is 4 in the years of 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985
