require_relative 'Appliances'

class Tubelight

    attr_reader :brightness
    def initialize(brightness)
        @brightness=brightness
    end

    def change_brightness(brightness)
        return {sucees: false, message: "The brightness is too low!!"}
        return {success: false,message: "THe brightness is too high!!"}
        @brightness=brightness
        return {success:true, message: "The brightness is set to #{@brightness}."}
    end
end