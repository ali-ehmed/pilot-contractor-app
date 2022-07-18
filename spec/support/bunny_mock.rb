require 'bunny-mock'

RSpec.configure do |config|
  config.before(:each) do
    BunnyClient.connection = BunnyMock.new
  end
end
