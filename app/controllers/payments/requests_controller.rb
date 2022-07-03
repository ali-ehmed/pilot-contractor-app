module Payments
  class RequestsController < ApplicationController
    def index
      @payments = Payment.order(amount: :desc)
    end
  end
end