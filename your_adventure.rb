require_relative './resources/the_island'
require 'pry'
puts LINCOLN_ISLAND
l = ME.location

ME.walk_east
puts ME.location.has_water?
ME.walk_east
puts ME.location.has_water?
ME.walk_east
puts ME.location.has_water?
ME.walk_east
puts ME.location.has_water?
cl = ME.location
puts ME.bucket_contents
ME.fill_bucket(cl.get_water)
puts ME.bucket_contents.to_s



binding.pry