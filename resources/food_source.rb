class Island::FoodSource
    
    def initialize
        @source

    end

    class Goat
        @attr_reader :state
        
        def initialize
            @state = :alive
            @meat = Meat.new
        end

        def harvest_meat
            if @state == :alive
                puts "The goat is alive!"
            else
                meat = @meat
                @meat = nil
                return meat
            end
        end

        def hunt
            @state = :dead
        end

        class Meat

            attr_accessor :state

            def initialize
                @state = :raw
            end
        end


    end

end