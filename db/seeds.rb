# Clear existing data
User.destroy_all
Report.destroy_all

# Create users
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)

user = User.create!(
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false
)

# Create 15 reports for both users
15.times do |i|
  Report.create!(
    title: "AI Market Report #{i + 1}",
    description: "<p>This is the <strong>description</strong> of report #{i + 1}.</p>",
    category: %w[Technology Business Health Education Finance].sample,
    status: %w[draft published archived].sample,
    published_on: Date.today - rand(30),
    user: [admin, user].sample
  )
end

puts "Seeded 2 users(admin & user) and 15 reports!"
