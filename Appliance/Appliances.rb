class Appliances
    attr_reader :name,:status
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
    def change_status(parament = false)
        @status = !@status
    end

    def show_confurigations

        appliance_confurugation = {}

        instance_variables.each do |variable|
            appliance_confurugation[variable] = instance_variable_get(variable)
        end

        appliance_confurugation
    end






   def display_edit_confurigation
    clear_screen
    puts "\n===== Current Configuration ====="
    variables_arr = instance_variables

  # Pretty table header
  puts format("%-5s %-20s %-20s", "No.", "Variable", "Value")
  puts "-" * 50

  variables_arr.each_with_index do |variable, index|
    value = instance_variable_get(variable)
    puts format("%-5d %-20s %-20s", index + 1, variable.to_s.delete("@"), value)
  end

  puts "\nChoose value to Edit (Enter number):"
  user_input = gets.chomp.to_i - 1

  key = variables_arr[user_input].to_s[1..]  # remove '@'

  unless( key == "status" || key == "cool_mode" || key == "swing" || key == "freezing")
      puts "Enter new value for '#{key}':"
      user_input_value = gets.chomp
  end

  # Try to preserve integer if possible
  user_input_value = user_input_value.to_i.to_s == user_input_value ? user_input_value.to_i : user_input_value

  result = self.send("change_#{key}",user_input_value)
  
  save_products_to_txt
end


end
