require 'faker'

676.times do
  Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 0..1000.0),
    stock_quantity: Faker::Number.number(digits: 3)
  )
end
