module BunnyClient
  def self.connection
    @connection ||= Bunny.new
  end
end