FactoryBot.define do
  factory :payment do
    amount { Faker::Number.between(from: 300, to: 5000) }
    currency  { Payment::CAD }
  end
end