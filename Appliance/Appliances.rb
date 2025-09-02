class Appliances
    def initialize(name)
        @name = name
        @status = false
    end
    def turn_on
        @status = true
    end
    def turn_off
        @status = false
    end
    def switch
        @status = !@status
    end
    def show_confurigations
        appliance_confurugation = {}
        instance_variables.each do |variable|
            appliance_confurugation[variable] = instance_variable_get(variable)
        end
        appliance_confurugation
    end
end