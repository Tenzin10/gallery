# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'seeding data ...\n'
User.destroy_all
user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
1.upto(10).each do
  PhotoGallery.create!(
    user: user,
    name: Faker::FunnyName.name,
    description: Faker::Lorem.sentence
  )
end

PhotoGallery.find_each do |gallery|
  photo = gallery.photos.build(
    name: "#{Faker::FunnyName.name} #{SecureRandom.hex(4)}",
    description: Faker::Lorem.sentence,
    shooting_date: DateTime.now
  )
  photo.image.attach(
    io: File.open(Rails.root.join('spec', 'fixtures', 'image.jpeg')),
    filename: 'image.jpeg',
    content_type: 'image/jpg'
  )
  photo.save!
end

p 'seeding done ...\n'
