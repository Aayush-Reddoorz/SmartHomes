#!/usr/bin/env ruby
require 'json'
require_relative 'ApplianceManager'

require_relative 'admin'
require_relative 'user'

# Method to print big ASCII header using figlet
def print_header
  header_text = 'SMART-HOMES'
  ascii_header = `figlet -f  standard "#{header_text}"`
  puts ascii_header
  puts "\nWelcome to Smart-Homes! Your home, smarter and safer.\n\n"
end

# Sample appliances database
$appliances = [
  { name: "Light", state: "Off", location: "Living Room" },
  { name: "AC", state: "On", location: "Bedroom" },
  { name: "Heater", state: "Off", location: "Bathroom" }
]

# Method to display appliances
def view_appliances
  puts "\n%-5s %-15s %-10s %-15s" % ["No", "Name", "State", "Location"]
  puts "-" * 50
  $appliances.each_with_index do |app, idx|
    puts "%-5d %-15s %-10s %-15s" % [idx + 1, app[:name], app[:state], app[:location]]
  end
end

ApplianceManagerInstance = ApplianceManager.instance #Create Base Class
ApplianceManagerInstance.get_appliances #Load Data

def save_products_to_txt
    applianceManagerInstance = ApplianceManagerInstance.instance
    products = applianceManagerInstance.products
    products_array = products.map { |product| product.show_confurigations }
    File.open("/Store/Configuration.txt", "w") do |file|
        file.write(JSON.pretty_generate(products_array))
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
