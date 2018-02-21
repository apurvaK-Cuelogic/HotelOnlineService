class SearchService
	def initialize(name_or_location,checkin,checkout)
		@name_or_location = name_or_location
		puts @checkin
		@checkin = checkin
		@checkout = checkout
	end

	def searchHotel
		@booking_rooms=Room.bookingrooms(@checkin,@checkout)
		@availableRooms=Hotel.hotelsearchResult(@booking_rooms,@name_or_location)
	end

	def searchRooms hotel_id
		@checkin= Rails.cache.read("checkin")
		@checkout= Rails.cache.read("checkout")
	    @booking_rooms=Room.bookingrooms(@checkin,@checkout)
	    h = Room.room_hotel_id(hotel_id).inactive.room_id_not(@booking_rooms).uniq
	end

	def check_room_select room_select
   		p = true
	    room_select.each do |key,value|
	      if value == 0.to_s
	        p = true
	      else
	        p = false
	        return false
	      end
	    end
	    true
  	end
end