FactoryBot.define do

  factory :photo_gallery do
    name { Faker::ProgrammingLanguage.name }
    description { Faker::ProgrammingLanguage.creator }
    user {}
  end
end