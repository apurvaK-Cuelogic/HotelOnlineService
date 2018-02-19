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
	end

	def check_room_select
	    flag = true
	    @params[:room_select].each do |k,v|
	      if v == 0.to_s
	        flag = true
	      else
	        flag = false
	        return false
	      end
	    end
	    true
  	end
end