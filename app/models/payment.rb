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
  ].freeze

  enum status: STATUSES.zip(STATUSES).to_h

  scope :latest, -> { order(created_at: :desc) }

  validates_presence_of :amount, :currency
  before_validation :set_default_status
  after_commit :request_payment_from_managers!, on: :create

  # Sets a default status when no status is available
  def set_default_status
    self.status = DRAFT unless status
  end

  # Updates status and request sent at column and send message to managers app
  def request_payment_from_managers!(force: false)
    ActiveRecord::Base.transaction do
      begin
        self.status = PENDING if draft? && force

        if approved_at.nil? && (pending? || force)
          update!(status: status, request_sent_at: Time.now)
          data = self.as_json
          data['initial_status'] = data.delete('status')
          MessageBroker::RequestPayment.publish(data)
        end
      rescue StandardError
        raise ActiveRecord::Rollback
      end
    end
  end
end
