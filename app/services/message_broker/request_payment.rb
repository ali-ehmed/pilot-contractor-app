module MessageBroker
  class RequestPayment < Base
    def publish(payment)
      ch = channel.fanout("payments.request")
      ch.publish(payment.to_json)
    end
  end
end