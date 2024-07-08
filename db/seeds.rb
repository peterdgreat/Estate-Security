# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

Announcement.destroy_all

announcements = [
  { title: 'First Announcement', content: 'This is the content of the first announcement.' },
  { title: 'Second Announcement', content: 'This is the content of the second announcement.' },
  { title: 'Third Announcement', content: 'This is the content of the third announcement.' },
  # Add more announcements as needed
]

announcements.each do |announcement_data|
  Announcement.create!(announcement_data)
end

puts "Seeded #{Announcement.count} announcements."
