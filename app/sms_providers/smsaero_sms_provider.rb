class SmsaeroSmsProvider

  def initialize
    @config = configus.sms_providers.smsaero
  end

  CODES = {
    1 => 1
  }

  def send(sms)
    url = @config.send_url
    params = {
      answer: 'json',
      user: @config.user,
      password: Digest::MD5.hexdigest(@config.password),
      to: sms.recipient,
      text: sms.message,
      from: @config.from
    }
    SmsSenderWorker.perform_async(url, params)
  end

end