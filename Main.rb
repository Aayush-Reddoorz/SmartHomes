#!/usr/bin/env ruby

# Method to print big ASCII header using figlet
def print_header
  header_text = 'SMART-HOMES'
  ascii_header = `figlet -f slant "#{header_text}"`
  puts ascii_header
  puts "\nWelcome to Smart-Homes! Your home, smarter and safer.\n\n"
end

# Sample appliances database
$appliances = [
  { name: "Light", state: "Off", location: "Living Room" },
  { name: "AC", state: "On", location: "Bedroom" },
  { name: "Heater", state: "Off", location: "Bathroom" }
]

# Admin menu
def admin_menu
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
      print "Appliance Name: "
      name = gets.chomp
      print "Location: "
      location = gets.chomp
      $appliances << { name: name, state: "Off", location: location }
      puts "#{name} added successfully!"
    when "2"
      puts "Select appliance to remove:"
      $appliances.each_with_index { |app, idx| puts "#{idx + 1}. #{app[:name]}" }
      print "Choice: "
      idx = gets.chomp.to_i - 1
      if idx >= 0 && idx < $appliances.size
        removed = $appliances.delete_at(idx)
        puts "#{removed[:name]} removed successfully!"
      else
        puts "Invalid choice."
      end
    when "3"
      view_appliances
    when "4"
      break
    else
      puts "Invalid option!"
    end
  end
end

# User menu
def user_menu
  loop do
    puts "\nAppliances:"
    view_appliances

    puts "\nOptions:"
    puts "1. Toggle Appliance State"
    puts "2. Logout"

    print "Enter your choice: "
    choice = gets.chomp

    case choice
    when "1"
      puts "Select appliance to toggle:"
      $appliances.each_with_index { |app, idx| puts "#{idx + 1}. #{app[:name]}" }
      print "Choice: "
      idx = gets.chomp.to_i - 1
      if idx >= 0 && idx < $appliances.size
        $appliances[idx][:state] = $appliances[idx][:state] == "On" ? "Off" : "On"
        puts "#{$appliances[idx][:name]} is now #{$appliances[idx][:state]}."
      else
        puts "Invalid choice."
      end
    when "2"
      break
    else
      puts "Invalid option!"
    end
  end
end

# Method to display appliances
def view_appliances
  puts "\n%-5s %-15s %-10s %-15s" % ["No", "Name", "State", "Location"]
  puts "-" * 50
  $appliances.each_with_index do |app, idx|
    puts "%-5d %-15s %-10s %-15s" % [idx + 1, app[:name], app[:state], app[:location]]
  end
end

# Main loop
loop do
  print_header
  puts "Choose Role:"
  puts "1. Admin (a)"
  puts "2. User (u)"
  puts "3. Exit (e)"
  print "Enter choice: "
  role = gets.chomp.downcase

  case role
  when "1", "a"
    admin_menu
  when "2", "u"
    user_menu
  when "3", "e"
    puts "Goodbye!"
    break
  else
    puts "Invalid choice. Try again."
  end
end
