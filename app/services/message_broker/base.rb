module MessageBroker
  class Base
    include Singleton

    class << self
      extend Forwardable
      def_delegators :instance, :publish, :channel, :connection
    end

    def publish
      raise NotImplementedError
    end

    def channel
      @channel ||= connection.create_channel
    end

    def connection
      @connection ||= BunnyClient.connection.tap(&:start)
    end
  end
end
