class Api::V1::PhonesController < Api::V1::ApplicationController

  def create
    phone = Phone.find_by_number(params[:number])

    if phone
      if phone.user_id?
        render json: {error: "Phone number exist"}, status: 409
      else
        send_sms(phone)
      end
    else
      phone = Phone.new(number: params[:number])
      if phone.save
        send_sms(phone)
      else
        render json: {result: 'phone not saved', errors: phone.errors}, status: 422
      end
    end
  end

  #FIXIT transfer to code_confirmation_controller
  #FIXIT drop confirmation code
  def registration
    phone = Phone.find_by_number(params[:number])

    if phone
      if phone.confirmation_code == params[:code]
        user = User.find(params[:user_id])
        phone.user = user
        if phone.confirm
          render json: {success: "Phone confirmed"}, status: 200
        else
          render json: {error: phone.errors}, status: 422
        end
      else
        render json: {error: "Invalid code"}, status: 409
      end
    else
      render json: {error: 'Phone not exist'}, status: 422
    end
  end

  def like
    phone = Phone.find_by_number(params[:number])

    if phone
      if phone.confirmation_code == params[:code]
        redirect_to api_v1_like_create_without_auth_path(image_id: params[:image_id], number: phone.number)
      else
        render json: {error: "Invalid code"}, status: 409
      end
    else
      render json: {error: 'Phone not exist'}, status: 422
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