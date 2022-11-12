# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
unless User.any?
  users = []
  (1..6).each do |order|
    puts "- Create user %d" % order
    users << {
      email: "user%d@sample.com" % order,
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    }
  end
  User.create(users)
  puts '- Doned.'
end
