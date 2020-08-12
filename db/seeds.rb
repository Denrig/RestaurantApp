User.create(
  name: 'AdminAdmin',
  email: 'bogdanboer99@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true,
  activated: true,
  activated_at: Time.now
)

User.create(
  name: 'Unregisterd',
  email: 'non-valid@mail.com',
  password: 'password',
  password_confirmation: 'password',
)

25.times do |n|
  User.create(
    name: Faker::Name.name,
    email: "example-#{n}@mail.com",
    password: 'password',
    password_confirmation: 'password',
    activated: true,
    activated_at: Time.now
  )
end
