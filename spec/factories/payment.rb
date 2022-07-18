FactoryBot.define do
  factory :payment do
    amount { Faker::Number.between(from: 300, to: 5000) }
    currency  { Payment::CAD }

    trait :without_request_payment_callback do
      after(:build) do
        Payment.skip_callback :commit, :after, :request_payment_from_managers!
      end

      after(:create) do
        class Payment; after_commit :request_payment_from_managers!, on: :create; end
      end
    end
  end
end