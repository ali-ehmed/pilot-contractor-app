class PaymentApprovalWorker
  include ::Sneakers::Worker

  from_queue PAYMENT_APPROVAL_EXCHANGE,
             exchange: PAYMENT_APPROVAL_EXCHANGE

  def work(payload)
    payload = JSON.parse(payload)
    @payment = Payment.find(payload["payment_id"])

    if payload["approved"]
      @payment.approved_at = payload["approved_at"]
      @payment.status = Payment::APPROVED
    else
      @payment.status = Payment::REJECTED
    end

    @payment.save!

    ack!
  end
end
