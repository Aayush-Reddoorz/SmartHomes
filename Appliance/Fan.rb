require_relative 'Appliances'

class Fan<Appliances
     
    @speed=0
    def initialize(speed)
        super('Fan')
      @speed=speed
    end

    def change_speed(level)
       return {}
    end
end