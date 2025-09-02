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