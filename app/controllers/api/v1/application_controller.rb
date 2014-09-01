class Api::V1::ApplicationController < ApplicationController
  respond_to :json

  def confirm_phone!
    phone = current_user.phones.last
    unless phone.present? && phone.confirmed?
      return render json: {error: 'Phone not confirmed'}, status: 409
    end
  end

end
