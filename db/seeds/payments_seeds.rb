class PaymentsSeeds
  DATA = [
    {
      amount: Faker::Number.between(from: 300, to: 5000),
      currency: Payment::USD,
      description: "Payment for the month of June 22 / Hours worked (135.68)",
    },
    {
      amount: Faker::Number.between(from: 300, to: 5000),
      currency: Payment::CAD,
      description: "Reimbursment",
    },
    {
      amount: Faker::Number.between(from: 300, to: 5000),
      currency: Payment::CAD,
      description: "Payment for the month of June 22 / Hours worked (100)",
    },
    {
      amount: Faker::Number.between(from: 300, to: 5000),
      currency: Payment::EUR,
      description: "Incentive/Bonus",
    },
    {
      amount: Faker::Number.between(from: 300, to: 5000),
      currency: Payment::EUR,
      description: "Monthly payment for hours worked (50)",
    }
  ].freeze

  def self.seed(data = DATA)
    return false if Payment.exists?

    data.each do |payment_data|
      Payment.create!(payment_data)
    end
  end
end