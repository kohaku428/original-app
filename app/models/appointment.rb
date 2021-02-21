class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :hairdresser
  has_one    :address
end
