MANAGER_EXCHANGES = [
  PAYMENT_APPROVAL_EXCHANGE = "payments.approval"
].freeze

Sneakers.configure(
  connection: Bunny.new,
  exchange_type: 'fanout',
  log: STDOUT,
  worker: 4,
  pid_path: 'tmp/pids/sneakers.pid',
  env: ENV['RAILS_ENV'],
  durable: false,
  ack: false,
  heartbeat: 5,
)

Sneakers.logger = Rails.logger
Sneakers.logger.level = Logger::WARN