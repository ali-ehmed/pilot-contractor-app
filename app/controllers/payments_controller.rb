class PaymentsController < ApplicationController
  def index
    @payments = Payment.latest
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to payments_path, notice: "Payment was successfully created"
    else
      render :new
    end
  end

  def request_payment
    @payment = Payment.find(params[:id])
    @payment.request_payment_from_managers!(force: true)
    redirect_to payments_path, notice: "Payment Request sent successfully"
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :currency, :description, :status)
  end
end
