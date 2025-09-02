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