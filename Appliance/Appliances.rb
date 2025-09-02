# appliance.rb
class Appliance
  attr_reader :name, :status

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

  def show_configurations
    instance_variables.each_with_object({}) do |var, hash|
      hash[var.to_s.delete("@")] = instance_variable_get(var)
    end
  end
end

class Fan < Appliance
  attr_reader :speed

  def initialize(name, speed = 1)
    super(name)
    @speed = speed
  end
end

class TV < Appliance
  attr_reader :volume, :channel

  def initialize(name, volume = 10, channel = 1)
    super(name)
    @volume = volume
    @channel = channel
  end
end

class AirConditioner < Appliance
  attr_reader :temperature, :timer, :speed, :cool_mode, :swing

  def initialize(name, temperature = 24, timer = 0, speed = 1, cool_mode = false, swing = false)
    super(name)
    @temperature = temperature
    @timer = timer
    @speed = speed
    @cool_mode = cool_mode
    @swing = swing
  end
end

class Refrigerator < Appliance
  attr_reader :cool_intensity, :freezing

  def initialize(name, cool_intensity = 5, freezing = false)
    super(name)
    @cool_intensity = cool_intensity
    @freezing = freezing
  end
end

class Tubelight < Appliance
  attr_reader :brightness

  def initialize(name, brightness = 100)
    super(name)
    @brightness = brightness
  end
end


# class Appliances
#     attr_reader :name,:status
#     def initialize(name)
#         @name = name
#         @status = false
#     end
#     def turn_on
#         @status = true
#     end
#     def turn_off
#         @status = false
#     end
#     def switch
#         @status = !@status
#     end
#     def show_confurigations

#         appliance_confurugation = {}

#         instance_variables.each do |variable|
#             appliance_confurugation[variable] = instance_variable_get(variable)
#         end

#         appliance_confurugation
#     end

#    def display_edit_confurigation
#   puts "\n===== Current Configuration ====="
#   variables_arr = instance_variables

#   # Pretty table header
#   puts format("%-5s %-20s %-20s", "No.", "Variable", "Value")
#   puts "-" * 50

#   variables_arr.each_with_index do |variable, index|
#     value = instance_variable_get(variable)
#     puts format("%-5d %-20s %-20s", index, variable.to_s.delete("@"), value)
#   end

#   puts "\nChoose value to Edit (Enter number):"
#   user_input = gets.chomp.to_i

#   key = variables_arr[user_input].to_s[1..]  # remove '@'
#   puts "Enter new value for '#{key}':"
#   user_input_value = gets.chomp

#   # Try to preserve integer if possible
#   user_input_value = user_input_value.to_i.to_s == user_input_value ? user_input_value.to_i : user_input_value

#   result = self.send("change_#{key}", user_input_value)

#   puts "\n===== Updated Configuration ====="
#   puts self.show_confurigations
# end


# end
