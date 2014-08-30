class Api::V1::CodeConfirmationsController < Api::V1::ApplicationController

  #FIXIT looks like pizdets
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
        like = Like.new(phone_id: phone.id, image_id: params[:image_id])
        if like.save
          return render json: {success: "Like it!"}, status: 202
        end
        render json: {warning: "Not action"}, status: 200
      else
        render json: {error: 'Invalid confirmation code'}, status: 422
      end
    else
      render json: {error: 'Phone not exist'}, status: 422
    end
  end

end