class Api::V1::CodeConfirmationsController < Api::V1::ApplicationController

  def create
    phone = Phone.find_by_number(params[:number])
    if phone.present?
      if phone.confirmation_code == params[:code]
        if user_signed_in?
          phone.user = current_user
          unless phone.confirm
            return render json: {error: phone.errors}, status: 422
          end
        end
        if params[:image_id].present?
          redirect_to api_v1_like_create_without_auth_path(image_id: params[:image_id], number: phone.number)
        end
      else
        render json: {error: 'Invalid confirmation code'}, status: 422
      end
    else
      render json: {error: 'Phone not exist'}, status: 422
    end
  end

end