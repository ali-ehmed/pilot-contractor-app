class Payment < ApplicationRecord
  CURRENCIES = [
    USD = "usd",
    CAD = "cad",
    EUR = "eur",
  ].freeze

  CURRENCY_UNITS = {
    USD => '$',
    CAD => '$',
    EUR => '€',
  }.freeze

  STATUSES = [
    DRAFT = 'draft',
    PENDING = 'pending',
    APPROVED = 'approved',
    REJECTED = 'rejected',
  ]

  enum status: STATUSES.zip(STATUSES).to_h

  validates_presence_of :amount, :currency, :status
  before_create :set_default_status

  def set_default_status
    self.status = DRAFT unless status
  end
end
