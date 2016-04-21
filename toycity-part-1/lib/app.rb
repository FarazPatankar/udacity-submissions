require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
puts "Today's Date: " + Time.now.strftime("%m/%d/%Y")

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
products_hash["items"].each do |product|

  # Print the name of the toy
  puts product["title"]
  puts "********************"

  # Print the retail price of the toy
  puts "Retail Price: $" + product["full-price"]

  # Calculate and print the total number of purchases
  total_purchases = product["purchases"].length
  puts "Total Purchases: #{total_purchases}"

  # Calculate and print the total amount of sales
  total_sales = 0.0
  product["purchases"].each do |purchase|
    total_sales += purchase["price"]
  end
  puts "Total Sales: $#{total_sales}"

  # Calculate and print the average price the toy sold for
  avg_price = total_sales/total_purchases
  puts "Average Price: $#{avg_price}"

  # Calculate and print the average discount (% or $) based off the average sales price
  avg_discount = product["full-price"].to_f - avg_price
  puts "Average Discount: $#{avg_discount}"

  avg_discount_percentage = (avg_discount/product["full-price"].to_f) * 100
  avg_discount_percentage = avg_discount_percentage.round(2)
  puts "Average Discount Percentage: #{avg_discount_percentage}%"
  puts "********************"
  puts
end

  puts " _                         _     "
  puts "| |                       | |    "
  puts "| |__  _ __ __ _ _ __   __| |___ "
  puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
  puts "| |_) | | | (_| | | | | (_| \\__ \\"
  puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
  puts

#Iterates over products hash and only adds unique brand names to the array.
brand_names = products_hash["items"].map { |item| item["brand"]}.uniq

# For each brand in the data set:
brand_names.each do |brand|

  # Print the name of the brand
  puts brand.upcase
  puts "********************"

  #Iterates over products hash and selects all objects that have the current brand name as their brand name
  brands = products_hash["items"].select {|item| item["brand"] == brand }

  # Count and print the number of the brand's toys we stock
  stock = 0
  brands.each do |brand|
    stock += brand["stock"].to_i
  end
  puts "Number of Products: #{stock}"

  # Calculate and print the average price of the brand's toys
  total_price = 0.0
  brands.each do |brand|
    total_price += brand["full-price"].to_f
  end
  avg_total_price = (total_price/brands.length).round(2)
  puts "Average Product Price: $#{avg_total_price}"

  # Calculate and print the total revenue of all the brand's toy sales combined
  total_revenue = 0.0
  brands.each do |brand|
    brand["purchases"].each do |purchase|
      total_revenue += purchase["price"]
    end
  end

  puts "Total Sales: $#{total_revenue.round(2)}"
end
