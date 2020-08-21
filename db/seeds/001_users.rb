[
  { name: 'Luke Skywalker', email: 'user@example.com', password: '12345678' }
].each do |u|
  User.create!(name: u[:name], email: u[:email], password: u[:password])
end
