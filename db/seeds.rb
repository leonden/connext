# Create an admin user
User.create!(
  name: "Admin",
  password: "thisisthemasterpassword",
  role: "admin"
)

# Create other test users
5.times do |n|
  name = "User#{n + 1}"
  password = "thisisthepasswordforuser#{n + 1}"
  role = "user"

  User.create!(
    name: name,
    password: password,
    role: role
  )
end
