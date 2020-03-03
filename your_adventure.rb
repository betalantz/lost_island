require_relative './resources/the_island'
require 'pry'


def purify_water(water)
    water.contents = water.contents.filter{ |c| c.name == :h20 }
    return water
end

def copy_water(water)
    return water.augmenti
end


def fill_bucket_with_water
    water = retrieve_water
    ME.fill_bucket(water)
end

def retrieve_water(micah)
    4.times do 
        micah.walk_east
    end
    water = micah.location.get_water
    4.times do 
        micah.walk_west
    end
    return water
end



dirty_water = retrieve_water(ME)
pure_water = purify_water(dirty_water)

# ME.walk_east
# puts ME.location.has_water?
# ME.walk_east
# puts ME.location.has_water?
# ME.walk_east
# puts ME.location.has_water?
# ME.walk_east
# puts ME.location.has_water?
# cl = ME.location
# puts ME.bucket_contents
# ME.fill_bucket(cl.get_water)
# puts ME.bucket_contents.to_s
# ME.go_home

# camp = ME.





binding.pry

