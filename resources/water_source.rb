require "ostruct"
class Island::WaterSource

    def initialize
        @water = Water.new
    end

    def get_water
        @water
    end

    class Water
        attr_accessor :contents

        def initialize
            @contents = [Bugs.new, Bacteria.new, Dirt.new, H20.new].shuffle
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

            def to_s
                "H20"
            end
        end

    end
end