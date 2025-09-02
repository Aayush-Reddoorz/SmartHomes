def view_appliances
    ApplianceManagerInstance.products.each do |product|  
      confi_hash = product.show_confurigations #This 
      
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