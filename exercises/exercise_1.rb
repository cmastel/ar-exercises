require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...

store_burnaby = Store.create(
  name: "Burnaby",
  annual_revenue: 300000,
  mens_apparel: true,
  womens_apparel: true,
)
store_burnaby.save

store_richmond = Store.create(
  name: "Richmond",
  annual_revenue: 1260000,
  mens_apparel: false,
  womens_apparel: true,
)
store_richmond.save

store_gastown = Store.create(
  name: "Gastown",
  annual_revenue: 190000,
  mens_apparel: true,
  womens_apparel: false,
)
store_gastown.save

puts Store.count()