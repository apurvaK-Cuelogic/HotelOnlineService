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
      room_id = []
      Rails.cache.read("rooms_selected").each do |key, value|
        if value != 0.to_s     
          room_id << key
        end     
      end
      room_details = Room.id(room_id).uniq  

      searchRoomExist=Room.joins(:bookings).where(:bookings=>{checkinDate: Rails.cache.read("checkin"),checkoutDate: Rails.cache.read("checkout")},id:room_details).uniq
          if(searchRoomExist.empty?)
		      @newBooking=Booking.create(checkinDate: Rails.cache.read("checkin").to_s,checkoutDate: Rails.cache.read("checkout").to_s,bookingDate: Date.today.to_s,member_id: current_member.id)
		      @newBooking.rooms << room_details   
		      BookingMailer.booking_confirmation(Member.find(current_member.id)).deliver_now
		      flash[:notice] = "Rooms booked successfully."
			    redirect_to '/home/index'  	
          else
                flash[:alert]="Rooms are already booked.."
                redirect_to '/home/index'
         end	
  end

  def myBooking
    @q = Booking.ransack(params[:q])
    @result = @q.result(distinct: true).where(member_id: current_member.id)
    @booking_details = Kaminari.paginate_array(@result).page(params[:page]).per(2)
  end
end
