require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject { build(:payment) }

  describe 'Validations' do
    it 'is invalid without amount' do
      expect(subject.valid?).to be_truthy
      subject.amount = nil
      expect(subject.valid?).to be_falsey
    end

    it 'is invalid without currency' do
      expect(subject.valid?).to be_truthy
      subject.currency = nil
      expect(subject.valid?).to be_falsey
    end
  end

  context 'Callbacks' do
    describe 'Before Create' do
      subject { build(:payment, status: nil) }
      it 'sets draft status when status is not present' do
        expect(subject.status).to be_nil
        subject.save!
        expect(subject).to be_persisted
        expect(subject.status).to eql(Payment::DRAFT)
      end
    end
  end

  context 'Instance Methods' do
    describe '#request_payment_from_managers!' do
      before do
        allow(MessageBroker::RequestPayment).to receive(:publish).and_return(nil)
      end
      subject { create(:payment, :without_request_payment_callback) }

      context 'When status is draft' do
        it 'updates status and request sent at time' do
          expect(subject.status).to eql(Payment::DRAFT)
          subject.request_payment_from_managers!(force: true)
          expect(subject.status).to eql(Payment::PENDING)
          expect(subject.request_sent_at).to_not be_nil
        end
      end

      context 'When status is pending' do
        it 'updates request sent at time' do
          expect(subject.request_sent_at).to be_nil
          subject.status = Payment::PENDING
          subject.request_payment_from_managers!
          expect(subject.request_sent_at).to_not be_nil
        end
      end

      context 'When payment is already approved' do
        it 'does not update status and request sent at time' do
          subject.approved_at = DateTime.now
          expect(subject.request_sent_at).to be_nil
          expect(subject.status).to eql(Payment::DRAFT)
        end
      end
    end
  end
end
