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

    def get_appliances
        saved_appliances = JSON.parse(File.read("./Store/Configuration.txt"))
        saved_appliances.each do |app_hash|
            name_of_appliance = app_hash["@name"]
            current_appliance = {}

            case name_of_appliance
            when "Fan" 
                current_appliance = Fan.new(app_hash["@status"],app_hash["@speed"])
            when "Tv"
                
            else

            end
            @products << current_appliance
        end

    #hash to object initilizase

    end
end


