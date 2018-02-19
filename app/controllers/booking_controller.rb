class BookingController < ApplicationController
  def index
  	
  	if member_signed_in?
          if params[:room_select]!=nil 
           
                  Rails.cache.write("rooms_selected",params[:room_select])
                  redirect_to booking_confirmBooking_path
          else
          
                redirect_to request.referer
          end
    else
        redirect_to '/members/sign_in'
    end
  end

  def confirmBooking
  	params = { :room_select => Rails.cache.read("rooms_selected") , :checkin => Rails.cache.read("checkin"), :checkout => Rails.cache.read("checkout"), :member => current_member.id}
  	@booking = BookingService.new params
  	@rooms_details = @booking.room_details
  	@hotel_details = @booking.hotel_details
  	@booking_price = @booking.total_booking_price
  end

  def create
  	  puts "***************************"
	  selected_rooms=Rails.cache.read("rooms_selected")
	  puts "ROOM SELE",selected_rooms
      @hotel_id=Room.select("hotel_id").where("id:?",selected_rooms.keys[0].to_i)

      @roomsList=Array.new
      selected_rooms.each do |rooms|
      @roomsList.push(Room.find(rooms.to_i))
      end

      searchRoomExist=Room.joins(:bookings).where(:bookings=>{checkinDate: Rails.cache.read("checkin"),checkoutDate: Rails.cache.read("checkout")},id:@roomsList).uniq
          if(searchRoomExist.empty?)
		      @newBooking=Booking.create(checkinDate: Rails.cache.read("checkin").to_s,checkoutDate: Rails.cache.read("checkout").to_s,bookingDate: Date.today.to_s,member_id: current_member.id)
		      @newBooking.rooms << @roomsList   
		      @hotelsList=@roomsList[0].hotel
		      flash[:notice] = "Rooms booked successfully."
			  redirect_to '/home/index'  	
          else
                flash[:alert]="Rooms are already booked.."
                redirect_to '/home/index'
         end	
  end
end
