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
      puts "\nSelect Appliance Type to Add:"
      appliance_types.each { |i, klass| puts "#{i}. #{klass}" }
      print "Choice: "
      type_choice = gets.chomp.to_i

      if appliance_types.key?(type_choice)
        print "Enter a name for this appliance: "
        custom_name = gets.chomp
        appliance = appliance_types[type_choice].new(custom_name)
        ApplianceManager.instance.add(appliance)
        puts "#{custom_name} (#{appliance.class}) added!"
      else
        puts "Invalid selection."
      end

    when "2"
      list = ApplianceManager.instance.list
      if list.empty?
        puts "No appliances to remove."
      else
        puts "\nSelect Appliance to Remove:"
        list.each_with_index { |app, i| puts "#{i + 1}. #{app.name} (#{app.class})" }
        print "Choice: "
        idx = gets.chomp.to_i - 1
        if idx >= 0 && idx < list.size
          removed = ApplianceManager.instance.remove(idx)
          puts "#{removed.name} removed."
        else
          puts "Invalid choice."
        end
      end

    when "3"
      list = ApplianceManager.instance.list
      if list.empty?
        puts "No appliances added yet."
      else
        puts "\nCurrent Appliances:"
        list.each_with_index do |app, i|
          puts "#{i + 1}. #{app.name} (#{app.class}) - #{app.status ? 'On' : 'Off'}"
        end
      end

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
