class Phone < ActiveRecord::Base
  attr_accessible :number, :confirmation_code

  belongs_to :user
  has_many :likes
  has_many :smses, class_name: 'Sms'

  validates :number, presence: true,
                     uniqueness: true

  state_machine initial: :init do
    state :init

    state :confirmed do
      validates :user, presence: true
    end

    event :confirm do
      transition init: :confirmed
    end

  end
end
