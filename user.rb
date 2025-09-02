def view_appliances
  puts "\n===== Appliances ====="
  puts format("%-15s %-10s %-30s", "Name", "Status", "Other Things")
  puts "-" * 60

  ApplianceManagerInstance.products.each do |product|
    confi_hash = product.show_confurigations.transform_keys { |k| k.to_s.delete("@") }

    name   = confi_hash["name"]
    status = confi_hash["status"]

    # Collect all remaining key-value pairs except name & status
    other_things = confi_hash.reject { |k, _| ["name", "status"].include?(k) }
                             .map { |k, v| "#{k}: #{v}" }
                             .join(", ")

    puts format("%-15s %-10s %-30s", name, status, other_things)
  end
end


# User menu
def user_menu
    puts "\nAll Appliances:"
    view_appliances
    puts "Choose appliance to change confurigations"
    user_input = gets.chomp.to_i
    ApplianceManagerInstance.products[user_input].display_edit_confurigation
end