class PaymentsController < ApplicationController
  def index
    @payments = Payment.order(amount: :desc)
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to payments_path
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :currency, :description, :status)
  end
end
