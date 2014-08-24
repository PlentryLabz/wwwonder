class BaseSmsProvider
  class ConnectionError < StandardError
  end

  def initialize(provider = nil)
    @provider = provider || SmsaeroSmsProvider.new
  end

  def send(sms)
    @provider.send(sms)
  end
end