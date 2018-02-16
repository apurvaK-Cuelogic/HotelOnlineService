class Room < ApplicationRecord
	belongs_to :hotel
	has_many :images, as: :imageable, dependent: :destroy
	has_and_belongs_to_many :bookings
	
	validates :hotel_id, :room_price, :room_rating, :no_of_bedrooms, presence: true 
	
	validates_numericality_of :room_price, :only_integer => true, 
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 99999,
    :message => "can only be whole number between 1 and 99999."
	
	validates :room_rating , :inclusion => {:in => 0..5, message:"must lie in between 0 to 5"},numericality: { only_integer: true }
	validates :room_description, length: { maximum: 100 }
	accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes[:image].nil? }
end
