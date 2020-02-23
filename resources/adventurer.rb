

class Adventurer

    attr_accessor :island, :location
    attr_reader :bucket_contents, :health, :state, :base

    def initialize(island)
        @island = island
        @location = island.starting_location
        @base = nil
        @bucket_contents = nil
        @health = 100
        @state = :alive
        @thirst = 50
        @hunger = 50
    end

    def walk_north
        walk(:north)
    end

    def walk_south
        walk(:south)
    end

    def walk_east
        walk(:east)
    end

    def walk_west
        walk(:west)
    end

    def go_home
        if @status == :dead
            puts "I CANNOT GO HOME BECAUSE I AM DEAD"
            return
        end
        @locaiton = @base
    end

    def fill_bucket(contents)
        if @status == :dead
            puts 'I CANNOT FILL MY BUCKET BECASUE I AM DEAD'
            return
        end
        @bucket_contents = contents
    end

    def drink(water)
        if @status == :dead
            puts "I CANNOT DRINK WATER BECAUSE I AM DEAD"
            return
        end
        if !water.is_a?(Island::WaterSource::Water)
            puts "THIS IS NOT WATER! I CANT DRINK IT!"
        else
            if water.contents.any?{ |c| c.name == :bacteria}
                @state = :dead
                puts "I AM DEAD."
            elsif water.contents.any?{ |c| c.name != :h20 }
                puts "UGH THAT MADE ME SICK!"
                decrement_health(10)
                puts "MY HEALTH IS NOW #{@health}"
            else
                @thirst -= 30
                if @thirst < 0
                    @thirst = 0
                end
            end
        end
    end

    private

    def decrement_health(amt)
        @health -= 10
        if @health < 0
            @health = 0
            status = :dead
        end
    end

    def walk(dir)
        if @state == :dead
            puts "I CANNOT WALK BECAUSE I AM DEAD"
            return
        end
        begin
            next_loc = @location.send(dir)
            if next_loc
                @location = next_loc 
            else
                puts "That is the ocean!"
            end
        rescue
            puts "THAT IS NOT A VALID DIRECTION!"
        end
        
    end

end