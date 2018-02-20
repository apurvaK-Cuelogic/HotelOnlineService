class BookingService

  def initialize params
    @params=params
  end

  def room_details
    room_id = []
    @params[:room_select].each do |key, value|
      if value != 0.to_s    
        room_id << key
      end     
    end
    @room_details = Room.id(room_id).uniq     
    @room_details
  end

  def total_booking_price
    value = @room_details.sum(&:room_price)
  end

  def get_hotel_id
    Room.select("hotel_id").id(@room_details[0]).uniq   
  end

  def hotel_details
    @hotel = get_hotel_id
  	@hotel_details = Hotel.id(@hotel[0][:hotel_id])
  	@hotel_details
  end

end