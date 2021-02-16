class Hairdresser < ApplicationRecord
  belongs_to :user
  has_one_attached :image
end
