class Api::V1::PhonesController < Api::V1::ApplicationController

  def create
    phone = Phone.find_by_number(params[:number])

    if phone.present?
      if phone.confirmed?
        render json: {error: "Phone number exist"}, status: 409
      else
        send_sms(phone)
      end
    else
      phone = Phone.new(number: params[:number])
      if phone.save
        send_sms(phone)
      else
        render json: {result: 'error', error: phone.errors}, status: 422
      end
    end
  end

  private

  def send_sms(phone)
    sms = Sms::PhoneConfirmation.new
    sms.phone = phone
    sms.sending
    if sms.delivered?
      render json: {result: 'success'}, status: 202
    elsif sms.failed?
      render json: {result: 'failed'}, status: 422
    end
  end

end