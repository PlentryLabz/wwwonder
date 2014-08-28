class Api::V1::SmsesController < Api::V1::ApplicationController

  def send_phone_confirmation_code
    phone = Phone.find_by_number(params[:number])
    sms = Sms::PhoneConfirmation.new
    sms.phone = phone
    sms.sending
    if sms.delivered?
      render json: {result: 'success'}, status: 200
    elsif sms.failed?
      render json: {result: 'failed'}, status: 422
    end
  end

end