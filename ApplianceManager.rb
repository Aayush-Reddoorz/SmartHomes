require 'singleton'

class ApplianceManager
    
    include Singleton

    attr_reader :products
    def initialize()
        @products = []
    end
    
    def add_product(product)
        @products<<product
    end
    
    def remove_product(index)
      @products.delete_at(index)
    end

    def get_appliances
        saved_appliances = JSON.parse(File.read("./Store/Configuration.txt"))
        saved_appliances.each do |app_hash|
            name_of_appliance = app_hash["@name"]
            current_appliance = {}

            case name_of_appliance
            when "Fan" 
                current_appliance = Fan.new(app_hash["@status"],app_hash["@speed"])
            when "Tv"
                current_appliance= Tv.new(app_hash["@status"],app_hash["@volume"],app_hash["@channel"])
            when "Tubelight"
                current_appliance=Tubelight.new(app_hash["@status"],app_hash["@brightness"])
            when "Refrigrator"
                 current_appliance= Refrigrator.new(app_hash["@status"],app_hash["@cool_intensity"],app_hash["@freezing"])
            when "Air Conditioner"
                 current_appliance= AirConditioner.new(app_hash["@status"],app_hash["@temprature"],app_hash["@timer"], app_hash["@speed"], app_hash["@cool_mode"],app_hash["@swing"])                
            end
            @products << current_appliance
        end

    #hash to object initilizase

    end
end


