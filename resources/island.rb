

class Island

    def self.create_island()
        rows = 15
        cols = 20
        water_locations = [
            [2,7],
            [7,4],
            [9,3],
            [14, 17]
        ]
        locations = Array.new(15, [])
        locations = locations.map.with_index do |l, rownum| 
            row = []
            for col in 0...cols
                row << Island::Location.new([rownum, col])
            end
            row
        end
        water_locations.each do |loc|
            locations[loc[0]][loc[1]].resources << Island::WaterSource.new
        end
        new(locations, locations[7][0])
    end

    attr_accessor :locations
    attr_reader :rows, :cols, :starting_location

    def initialize(locations, starting_location=nil)
        @rows, @cols = locations.length, locations.first.length
        @locations = locations
        @starting_location = starting_location
        @starting_location.resources << Island::Camp.new
        @locations.each { |row| row.each{ |l|  l.island = self} }
    end




end