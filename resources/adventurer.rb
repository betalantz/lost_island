

class Adventurer

    attr_accessor :island, :location
    attr_reader :bucket_contents, :health, :state, :base, :thirst, :hunger

    def initialize(island)
        @island = island
        @location = island.starting_location
        @base = @location
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
        if @state == :dead
            puts "I CANNOT GO HOME BECAUSE I AM DEAD"
            return
        end
        puts "Going home..."
        @location = @base
    end

    def fill_bucket(contents)
        if @state == :dead
            puts 'I CANNOT FILL MY BUCKET BECASUE I AM DEAD'
            return
        end
        @bucket_contents = contents
    end

    def drink(water)
        if @state == :dead
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
            end
            if h20 = water.contents.find{ |c| c.name == :h20 }
                raise StandardError.new("YOU CHEATER!") if h20.created_at > LOCK_TIME
                @thirst -= 30
                if @thirst < 0
                    @thirst = 0
                end
            end
            water.contents = []
        end
    end

    private

    def decrement_health(amt)
        @health -= 10
        if @health < 0
            @health = 0
            status = :dead
            puts "I AM DEAD"
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