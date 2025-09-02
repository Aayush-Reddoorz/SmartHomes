require_relative 'Appliances' 

class Fan<Appliances
     
    attr_reader :speed

    def initialize
      super('Fan')
      @speed=5
    end

    def change_speed(speed)
       return {success: false, message: "#{@speed} speed is too low!!"} if speed<0
       return {success:false, message: "#{@speed} speed is too high!!"} if speed>5
       @speed=speed
       return {success:true, message: "The speed is set to #{@speed}."}
    end
end

current_fan = Fan.new
current_fan.display_edit_confurigation
