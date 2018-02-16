class BookingsRoom < ApplicationRecord
  belongs_to :room
  belongs_to :booking
end
