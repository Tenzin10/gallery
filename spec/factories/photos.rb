FactoryBot.define do

  factory :photo do
    name { Faker::ProgrammingLanguage.name }
    description { Faker::ProgrammingLanguage.creator }
    shooting_date { DateTime.yesterday }
    photo_gallery {}

    after(:build) do |photo|
      photo.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'image.jpeg')),
        filename: "image.jpeg",
        content_type: "image/jpg"
      )
    end
  end
end
