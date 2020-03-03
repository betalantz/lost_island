

class Island::Location

    attr_accessor :resources, :island
    attr_reader :island, :row, :col

    def initialize(loc, *resources)
        @row, @col = loc
        @resources = resources
    end

    def north
        return nil if row == 0
        island.locations[row - 1][col]
    end

    def south
        return nil if row >= island.rows - 1
        island.locations[row + 1][col]
    end

    def east
        return nil if col >= island.cols - 1
        island.locations[row][col + 1]
    end

    def west
        return nil if col == 0
        island.locations[row][col - 1]
    end

    def has_water?
        return @resources.any? { |i| i.class == Island::WaterSource }
    end

    def has_camp?
        return @resources.any? { |i| i.class == Island::Camp }
    end

    def camp
        if has_camp?
            return @resources.find{ |r| r.class == Island::Camp }
        else
            puts "There is no camp here!"
        end
    end

    def get_water
        if has_water?
            return @resources.find{ |r| r.class == Island::WaterSource }.get_water
        else
            puts "There is no water here!"
        end
    end

end