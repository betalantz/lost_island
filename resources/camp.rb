

class Island::Camp

    def initialize()
        @items = [:flint,]
        @fire_lit = false
    end

    def light_fire
        @fire_lit = true
    end

    def boil_water(water)
        if @fire_lit
            water.contents = water.contents.filter{ |c| c.name != :bacteria }
        else
            puts "You can't boil water without a lit fire!"
        end
    end

    def cook_meat(meat)
        if @fire_lit
            meat.instance_variable_set("@state", :cooked)
            return meat
        else    
            puts "You can't cook food without a fire!"
        end
    end

end