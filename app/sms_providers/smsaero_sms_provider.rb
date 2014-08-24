class SmsaeroSmsProvider

  def initialize
    @config = configus.sms_providers.smsaero
  end

  CODES = {
    1 => 1
  }

  def send(sms)
    url = 'http://gate.smsaero.ru/send/'
    params = {
      answer: 'json',
      user: @config.user,
      password: Digest::MD5.hexdigest(@config.password),
      to: sms.recipient,
      text: sms.message,
      from: @config.from
    }
    response = RestClient.post url, params
    code = 1
    CODES[code]
  end

end