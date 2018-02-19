class SearchService
	def initialize(name_or_location,checkin,checkout)
		@name_or_location = name_or_location
		@checkin = checkin
		@checkout = checkout
	end

	def searchHotel
		#room_booked = Room.select("id").checkin_checkout(@checkin,@checkout)
	#	hotel_list = Hotel.joins(:rooms).name_location(@name_or_location).room_inactive.room_id_not(room_booked).uniq
		@booking_rooms=Room.bookingrooms(@checkin,@checkout)
		@availableRooms=Hotel.hotelsearchResult(@booking_rooms,@name_or_location)
	end

	def searchRooms hotel_id
    @booking_rooms=Room.bookingrooms(@checkinDate,@checkoutDate)
    h = Room.room_hotel_id(hotel_id).inactive.room_id_not(@booking_rooms).uniq
    #h = Room.joins(:hotel).where("hotels.id = :col_1 AND rooms.inactive IS NULL AND rooms.id NOT IN (:col_2)" , { col_1: hotel_id , col_2: r} ).group("rooms.id,rooms.price,rooms.no_of_bedroom").uniq    
end
end