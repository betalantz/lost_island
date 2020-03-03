
class Island::WaterSource

    def initialize
        @water = Water.new
    end

    def get_water
        old_water = @water
        new_water = @water.aguamenti
        new_water.contents.concat [Water::Bugs.new, Water::Bacteria.new, Water::Dirt.new]
        new_water.contents = new_water.contents.shuffle
        @water = new_water
        old_water
    end

    class Water
        attr_accessor :contents


        def initialize
            @contents = [Bugs.new, Bacteria.new, Dirt.new, H20.new].shuffle
        end

        def aguamenti
            h20 = contents.find { |c| c.name == :h20 }
            nh20 = H20.new
            if nh20.cheat_time(h20)
                @contents = [nh20]
            end
            nw = Water.new
            nw.contents = [nh20]
            nw
        end

        class Bugs
            attr_accessor :name
            def initialize
                @name = :bugs
            end
        end

        class Bacteria
            attr_accessor :name
            def initialize
                @name = :bacteria
            end
        end

        class Dirt
            attr_accessor :name
            def initialize
                @name = :dirt
            end
        end

        class H20
            attr_accessor :name
            attr_reader :created_at
            def initialize
                @created_at = Time.now
                @created_at.freeze
                @name = :h20
            end

            def cheat_time(valid_water)
                if valid_water.created_at < LOCK_TIME
                    @created_at = valid_water.created_at
                    true
                else
                    false
                end
            end

            def to_s
                "H20"
            end
        end

    end
end