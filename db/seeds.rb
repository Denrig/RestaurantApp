User.create(
  name: 'AdminAdmin',
  email: 'bogdanboer99@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true,
  activated: true,
  activated_at: Time.now,
  cart: Cart.new
)

10.times do |n|
  User.create(
    name: Faker::Name.name,
    email: "example-#{n}@mail.com",
    password: 'password',
    password_confirmation: 'password',
    activated: true,
    activated_at: Time.now,
    cart: Cart.new
  )
end

10.times do
  product = Product.new(
    title: 'Test',
    price: 12,
    category: 'Test'
  )
  product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'dish.png')), filename: 'dish.png')
  product.save!
end
