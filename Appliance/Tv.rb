require_relative 'Appliances'

class Tv<Appliances
     
    attr_reader :volume, :channel
    def initialize
        @volume=5
        @channel=100
    end

    def change_volume(volume)
        return {success: false, message: "#{@volume} volume is too low!!"} if volume<0
        return {success:false, message: "#{@volume} volume is too high!!"} if volume>100
        @volume=volume
        return {success: true, message: "The volume is set to #{@volume}"}
    end

    def change_channel(channel)
        return {success: false, message: "#{@channel} Channel does not exist!!"} if channel<0
        return {success:false, message: "#{@channel} Channel does not exist!!"} if channel>100
        @volume=volume
        return {success: true, message: "The channel is set to #{@channel}."}
    end

end