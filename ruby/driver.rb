require_relative './solution/hash-map.rb'

puts "empty hash"
h = HashMap.new

puts "\nadding b: 15 to hash"
h.put("b", 15)

puts "\nadding b: 14 to hash"
begin
  h.put("b", 14)
rescue ArgumentError
  puts "successfully triggered ArgumentError for duplicate key!"
end

puts "\nhash with b: 15"
p h

puts "\ngetting value for key b"
p h.get_value("b")
