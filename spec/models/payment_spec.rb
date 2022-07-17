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
end
