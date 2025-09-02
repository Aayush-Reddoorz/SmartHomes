require_relative 'Appliances' 

class Fan<Appliances
    @speed=0
    def initialize(speed)
        super('Fan')
      @speed=speed
    end

    def change_speed(level)
       return {success: false, message: "The fan is at its minimum speed!!"} if speed<0
       return {success:false, message: "The fan is at its maximum speed!!"} if speed>5
       @speed=speed
       return {success:true, message: "The speed is set to #{@speed}"}
    end
end