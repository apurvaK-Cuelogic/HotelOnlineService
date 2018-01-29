class Room < ApplicationRecord
	belongs_to :hotel
	validates :room_price, :room_rating, :no_of_bedrooms, presence: true 
	
	
end
