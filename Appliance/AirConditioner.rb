class AirConditioner
    @attr_reader :temprature,:timer,:speed,:cool_mode,:swing
    def initialize
       super("Air Conditoner")
       @temprature = 25
       @timer = 0
       @speed = 0
       @cool_mode = false
       @swing = false
    end

    def change_temprature(temp)
        return {success: false,message: "Temprature is too low !!"} if(temp < 16) 
        return {success: false,message: "Temprature is too High !!"} if(temp > 30) 
        @temprature = temp
        return {success: true, message: "Temprature set to #{temp}"}
    end

    def change_timer(time)
        return {success: false,message: "Timer is too low !!"} if(time < 0) 
        return {success: false,message: "Timer is too High !!"} if(time > 12) 
        @timer = time
        return {success: true, message: "Timer set to #{time} hours"}
    end

    def change_speed(speed)
        return {success: false,message: "Speed is too low !!"} if(speed < 0) 
        return {success: false,message: "Speed is too High !!"} if(speed > 5) 
        @speed = speed
        return {success: true, message: "Speed set to #{speed}"}
    end

    def cool_mode_switch
        @cool_mode = !@cool_mode
        return {success: true, message: "Cool mode is #{@cool_mode ? 'On' : 'Off'}"}
    end

    def swing_switch
        @swing = !@swing
        return {success: true, message: "Swing is #{@swing ? 'On' : 'Off'}"}
    end 

end