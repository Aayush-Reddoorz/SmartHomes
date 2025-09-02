class Refrigrator < Appliances
    @attr_reader :cool_intensity,:freezing
    def initialize
        super("Refrigrator")
        @cool_intensity = 3
        @freezing = false
    end

    def change_cool_intensity(instensity)
        return {success: false,message: "Cool Intensity is too low !!"} if(intensity < 1)
        return {success: false,message: "Cool Intensity is too high !!"} if(intensity > 5)
        @cool_intensity = intensity
        return {success: true,message: "Cool Intensity is set to #{@cool_intensity}"}
    end

    def change_freezing
        @freezing = !@freezing
        return {success: true,message: "Freezing is #{@freezing ? "On" : "Off"}"}
    end
end