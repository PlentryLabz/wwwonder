class Sms::PhoneConfirmation < Sms
  SMS_SEND_TODAY_MAX = 5

  after_initialize :set_message
  after_save :update_user_with_code

  # validates :sent_today_count, numericality: { less_than: SMS_SEND_TODAY_MAX, message: "Sms limit"}

  attr_accessor :code

  def set_message
    @code ||= phone_confirmation_code
    self.message = "Your confirmation code: #{self.code}"
  end

  def update_user_with_code
    user = self.user
    user.update_attributes(phone_confirmation_code: @code)
  end

  def phone_confirmation_code
    safe_symbols = %w{ 1 2 3 4 5 6 7 8 9 A B C D E F G H K L M N P R S T U V W X Y Z }
    (0..5).map{|e| safe_symbols[ rand(safe_symbols.size) ]}.join
  end

end