require "csv"

# Clear existing data
Product.destroy_all
Category.destroy_all

csv_text = File.read(Rails.root.join('db', 'products.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  category_name = row['category_name']
  category = Category.find_or_create_by(name: category_name)

  product = Product.create!(
    name: row['name'],
    description: row['description'],
    price: row['price'],
    category: category
  )
  puts "#{product.name} created with category #{category.name}"
end
