# require 'singleton'

# class ApplianceManager
#   include Singleton

#   attr_reader :appliances

#   def initialize
#     @appliances = []
#   end

#   def add_appliance(appliance)
#     @appliances << appliance
#   end

#   def remove_appliance(index)
#     @appliances.delete_at(index)
#   end

#   def list_appliances
#     @appliances
#   end

#   def save_to_file
#     appliances_data = @appliances.map do |appliance|
#       {
#         name: appliance.name,
#         status: appliance.status,
#         location: appliance.location
#       }
#     end
#     File.write("appliances.json", JSON.pretty_generate(appliances_data))
#   end

#   def load_from_file
#     if File.exist?("appliances.json")
#       appliances_data = JSON.parse(File.read("appliances.json"))
#       appliances_data.each do |data|
#         appliance = Object.const_get(data["name"]).new(data["name"], data["location"])
#         appliance.status = data["status"]
#         add_appliance(appliance)
#       end
#     end
#   end
# end

require 'singleton'
require 'json'

class ApplianceManager
  include Singleton
  attr_reader :products

  def initialize
    @products = []
  end

  def get_appliances
    file_path = "/Store/Configuration.txt"

    # Check if the file exists and is not empty
    if File.exist?(file_path) && !File.zero?(file_path)
      begin
        saved_appliances = JSON.parse(File.read(file_path))
        saved_appliances.each do |app_hash|
          name_of_appliance = app_hash["@name"]
          current_appliance = case name_of_appliance
                              when "Fan"
                                Fan.new(app_hash["@status"], app_hash["@speed"])
                              when "Tv"
                                Tv.new(app_hash["@status"], app_hash["@volume"], app_hash["@channel"])
                              when "Tubelight"
                                Tubelight.new(app_hash["@status"], app_hash["@brightness"])
                              when "Refrigerator"
                                Refrigerator.new(app_hash["@status"], app_hash["@cool_intensity"], app_hash["@freezing"])
                              when "AirConditioner"
                                AirConditioner.new(app_hash["@status"], app_hash["@temperature"], app_hash["@timer"], app_hash["@speed"], app_hash["@cool_mode"], app_hash["@swing"])
                              else
                                nil
                              end
          @products << current_appliance if current_appliance
        end
      rescue JSON::ParserError => e
        puts "Error parsing JSON: #{e.message}"
      end
    else
      puts "Configuration file is empty or missing."
    end
  end
end


   # def get_appliances
   #     saved_appliances = JSON.parse(File.read("Store/Configuration.txt"))
        
    #     saved_appliances.each do |app_hash|
    #         name_of_appliance = app_hash["@name"]
    #         current_appliance = {}

    #         case name_of_appliance
    #         when "Fan" 
    #             current_appliance = Fan.new(app_hash["@status"],app_hash["@speed"])
    #         when "Tv"
    #             current_appliance= Tv.new(app_hash["@status"],app_hash["@volume"],app_hash["@channel"])
    #         when "Tubelight"
    #             current_appliance=Tubelight.new(app_hash["@status"],app_hash["@brightness"])
    #         when "Refrigrator"
    #              current_appliance= Refrigrator.new(app_hash["@status"],app_hash["@cool_intensity"],app_hash["@freezing"])
    #         when "AirConditioner"
    #              current_appliance= AirConditioner.new(app_hash["@status"],app_hash["@temprature"],app_hash["@timer"], app_hash["@speed"], app_hash["@cool_mode"],app_hash["@swing"])                
    #         end
    #         @products << current_appliance
    #     end

    # #hash to object initilizase

    # end



