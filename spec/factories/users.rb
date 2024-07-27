FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    age_id                { Faker::Number.between(from: 1, to: 3) }
    gender_id             { Faker::Number.between(from: 1, to: 3) }
  end
end
