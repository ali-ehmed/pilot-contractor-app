module BunnyClient
  def self.connection
    @connection ||= Bunny.new
  end

  def self.connection=(client_object)
    @connection = client_object
  end
end