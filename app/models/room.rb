class Room < ApplicationRecord
	belongs_to :hotel
	has_many :images, as: :imageable, dependent: :destroy
	has_and_belongs_to_many :bookings, :join_table => :bookings_rooms
	
	validates :hotel_id, :room_price, :room_rating, :no_of_bedrooms, presence: true 
	
	validates_numericality_of :room_price, :only_integer => true, 
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 99999,
    :message => "can only be whole number between 1 and 99999."
	
	validates :room_rating , :inclusion => {:in => 0..5, message:"must lie in between 0 to 5"},numericality: { only_integer: true, message:"must lie in between 0 to 5" }
	validates :room_description, length: { maximum: 100 }
	accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes[:image].nil? }

	scope :inactive, ->{where(inactive_date: nil)}
	scope :active, ->{where.not(inactive_date: nil)}
	scope :room_hotel_id, -> (id){ joins(:hotel).where( rooms: {"hotel_id": id })}
	scope :room_id_not, -> (query){ where.not( "id": query ) }
	scope :id, ->(id){ where("id": id)}
	scope :bookingrooms, -> (checkinDate,checkoutDate){ joins(:bookings).select("id").where('"checkinDate" BETWEEN ? AND ? OR "checkoutDate" BETWEEN ? AND ?',checkinDate,checkoutDate,checkinDate,checkoutDate)}
	scope :booking_date, -> (date){ joins(:bookings).where("bookings.bookingDate = ? ", "#{date}" ) }
  	scope :booking_member_id, -> (member_id){ where("bookings.member_id = ? ", "#{member_id}" ) }
  	scope :checkin_checkout_eq, -> (checkin, checkout){ joins(:bookings).where("bookings.checkinDate = ? AND bookings.checkoutDate = ? ", "#{checkin}" , "#{checkout}") }

 	def self.delete_inactive_rooms
   		Room.where("inactive_date < NOW() - INTERVAL '30 DAY'").destroy_all
	end
end
