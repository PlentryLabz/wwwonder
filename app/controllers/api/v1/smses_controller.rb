class Api::V1::SmsesController < Api::V1::ApplicationController

  def send_phone_confirmation_code
    user = user_signed_in? ? current_user : User.find_by_phone_number(params[:phone_number])
    unless user.present?
      user = User.create!(phone_number: params[:phone_number])
    end
    sms = Sms::PhoneConfirmation.new(user_id: user.id)
    sms.sending
    if sms.delivered?
      render json: {result: 'success'}, status: 200
    elsif sms.failed?
      render json: {result: 'failed'}, status: 422
    end
  end

end