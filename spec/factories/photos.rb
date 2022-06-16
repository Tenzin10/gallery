FactoryBot.define do

  factory :photo do
    name { Faker::ProgrammingLanguage.name }
    description { Faker::ProgrammingLanguage.creator }
    shooting_date { DateTime.yesterday }
    photo_gallery {}
  end
end