require 'rails_helper'

RSpec.describe PaymentApprovalWorker do
  subject { described_class.new }
  let!(:payment) { create(:payment, status: Payment::PENDING) }

  describe '#work' do
    it 'updates payment with approved status' do
      expect(payment.status).to eql(Payment::PENDING)
      subject.work({ payment_id: payment.id, approved: true, approved_at: DateTime.now }.to_json)
      expect(payment.reload.status).to eql(Payment::APPROVED)
      expect(payment.reload.approved_at).to_not be_nil
    end

    it 'updates payment with rejected status' do
      expect(payment.status).to eql(Payment::PENDING)
      subject.work({ payment_id: payment.id, approved: false }.to_json)
      expect(payment.reload.status).to eql(Payment::REJECTED)
      expect(payment.reload.approved_at).to be_nil
    end
  end
end
