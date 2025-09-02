require_relative 'Appliances'

class Tubelight< Appliances

    attr_reader :brightness

    def initialize(status = false,brightness=5)
        super("Tubelight")
        @brightness=brightness
    end

    def change_brightness(brightness)
        return {sucees: false, message: "The brightness is too low!!"} if brightness<0
        return {success: false,message: "THe brightness is too high!!"} if brightness>5
        @brightness=brightness
        return {success:true, message: "The brightness is set to #{@brightness}."}
    end
end