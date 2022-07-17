require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    let!(:payments) { create_list(:payment, 3) }

    it "assigns @payments ordered by amount" do
      get :index
      expect(assigns(:payments)).to eq(payments.sort_by(&:amount).reverse)
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    it "assigns @payment" do
      get :new
      expect(assigns(:payment)).to_not be_nil
      expect(assigns(:payment).persisted?).to be_falsey
    end

    it 'renders index template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#crate' do
    let(:payment) { build(:payment) }

    it "creates payment" do
      post :create, params: {
        payment: { amount: payment.amount, currency: payment.currency, description: payment.description, status: payment.status }
      }
      expect(assigns(:payment).valid?).to be_truthy
      expect(assigns(:payment).persisted?).to be_truthy
      expect(response).to redirect_to(payments_path)
    end

    it "renders error" do
      post :create, params: {
        payment: { amount: nil, currency: payment.currency, description: payment.description, status: payment.status }
      }
      expect(assigns(:payment).valid?).to be_falsey
      expect(assigns(:payment).persisted?).to be_falsey
      expect(response).to render_template(:new)
    end
  end
end
