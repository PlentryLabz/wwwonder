class Sms < ActiveRecord::Base
  attr_accessor :state_code
  attr_accessible :message, :recipient, :user_id

  belongs_to :user

  validates :recipient, :message, :user, presence: true

  state_machine initial: :init do
    state :init
    state :pending

    state :delivered do
      validates :state_code, numericality: { greater_than: 0 }
    end

    state :failed do
      validates :state_code, numericality: { less_or_equal_than: 0 }
    end

    event :prepare do
      transition init: :pending
    end

    event :deliver do
      transition pending: :delivered
    end

    event :become_failed do
      transition pending: :failed
    end
  end

  def sending
    prepare
    self.state_code = sms_provider.send(self)
    deliver or become_failed
  rescue BaseSmsProvider::ConnectionError
    self.state_code = 0
    become_failed
  end

  def sms_provider
    @sms_provider ||= BaseSmsProvider.new
  end

  def recipient
    self.recipient = user.phone_number
  end
end
