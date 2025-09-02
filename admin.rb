require_relative 'Appliance/Fan'
require_relative 'Appliance/Tv'
require_relative 'Appliance/AirConditioner'
require_relative 'Appliance/Refrigerator'
require_relative 'Appliance/Tubelight'


# admin.rb
def admin_menu
  appliance_types = {
    1 => Fan,
    2 => TV,
    3 => AirConditioner,
    4 => Refrigerator,
    5 => Tubelight
  }

  loop do
    puts "\nAdmin Options:"
    puts "1. Add Appliance"
    puts "2. Remove Appliance"
    puts "3. View Appliances"
    puts "4. Logout"
    print "Enter your choice: "
    choice = gets.chomp

    case choice
    when "1"
          clear_screen
          puts "Select Appliance to Add:"
          puts "1. Air Conditioner"
          puts "2. Fan"
          puts "3. Tv"
          puts "4. Tubelight"
          puts "5. Refrigrator"

          puts "Enter choice:"
          app_choice = gets.chomp
          user_appliance = {}

          case app_choice
          when "1"
             user_appliance =  AirConditioner.new
          when "2"
            user_appliance = Fan.new
          when "3"
            user_appliance = Tv.new
            when "4"
            user_appliance = Tubelight.new
          when "5"
            user_appliance = Refrigrator.new
          else
            puts "Invalid option!"
          end

          ApplianceManagerInstance.add_product(user_appliance)
          save_products_to_txt
          clear_screen
          puts "#{user_appliance.name} added successfully!"
    when "2"
          clear_screen
          view_appliances
          puts "Enter Serial Number of Appliance to remove : "
          
          user_Choice = gets.chomp.to_i
          ApplianceManagerInstance.remove_product(user_Choice - 1)
          
          save_products_to_txt
          
          clear_screen 
          puts "Remove Successfull"

    when "3"
      clear_screen
      view_appliances
    when "4"
      break

    else
      puts "Invalid option!"
    end

  end
end



# def admin_menu
#   loop do
#     puts "\nAdmin Options:"
#     puts "1. Add Appliance"
#     puts "2. Remove Appliance"
#     puts "3. View Appliances"
#     puts "4. Logout"

#     print "Enter your choice: "
#     choice = gets.chomp

#     case choice
#     when "1"
#       print "Appliance Name: "
#       name = gets.chomp
#       print "Location: "
#       location = gets.chomp
#       $appliances << { name: name, state: "Off", location: location }
#       puts "#{name} added successfully!"
#     when "2"
#       puts "Select appliance to remove:"
#       $appliances.each_with_index { |app, idx| puts "#{idx + 1}. #{app[:name]}" }
#       print "Choice: "
#       idx = gets.chomp.to_i - 1
#       if idx >= 0 && idx < $appliances.size
#         removed = $appliances.delete_at(idx)
#         puts "#{removed[:name]} removed successfully!"
#       else
#         puts "Invalid choice."
#       end
#     when "3"
#       view_appliances
#     when "4"
#       break
#     else
#       puts "Invalid option!"
#     end
#   end
# end
