def view_appliances
  puts "\n===== Appliances ====="
  puts format("%-5s %-15s %-10s %-30s", "No.", "Name", "Status", "Other Things")
  puts "-" * 70

  ApplianceManagerInstance.products.each_with_index do |product, index|
    confi_hash = product.show_confurigations.transform_keys { |k| k.to_s.delete("@") }

    name   = confi_hash["name"]
    status = confi_hash["status"]

    # Collect all remaining key-value pairs except name & status
    other_things = confi_hash.reject { |k, _| ["name", "status"].include?(k) }
                             .map { |k, v| "#{k}: #{v}" }
                             .join(", ")

    puts format("%-5d %-15s %-10s %-30s", index + 1, name, status, other_things)
  end
end



# User menu
def user_menu
  
  loop do
    clear_screen
    puts "\nAll Appliances:"
    view_appliances
    puts "Choose appliance to change confurigations"
    user_input = gets.chomp.to_i
    ApplianceManagerInstance.products[user_input - 1].display_edit_confurigation 
  end

end