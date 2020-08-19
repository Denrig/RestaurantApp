User.create_or_find_by(
  name: 'Bogdan Boer',
  email: 'bogdanboer99@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true,
  activated: true,
  activated_at: Time.now,
  cart: Cart.new
)

product = Product.new(
  title: 'Pizza Carbonara',
  category: 'Pizza',
  price: 11
)
product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'carbonara.jpg')), filename: 'carbonara.jpg')
product.save!

product = Product.new(
  title: 'Pizza Calzone',
  category: 'Pizza',
  price: 12
)
product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'calzone.jpg')), filename: 'calzone.jpg')
product.save!

product = Product.new(
  title: 'Fettuccine Alfredo',
  category: 'Pasta',
  price: 10
)
product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'alf.jpg')), filename: 'alf.jpg')
product.save!

product = Product.new(
  title: 'Pork Ribs',
  category: 'BBQ',
  price: 15
)
product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'ribs.jpg')), filename: 'ribs.jpg')
product.save!

product = Product.new(
  title: 'Rib Eye Steak',
  category: 'BBQ',
  price: 9
)
product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'rib_eye.jpg')), filename: 'rib_eye.jpg')
product.save!
