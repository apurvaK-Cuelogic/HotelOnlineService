class SearchController < ApplicationController
	layout false, except: [:show]
	def searchView
		@name_or_location = params[:name_or_location]
		@checkin = params[:checkin]
		@checkout = params[:checkout]

		Rails.cache.write("checkin",@checkin)
		Rails.cache.write("checkout",@checkout)
		@search_service_obj = SearchService.new(@name_or_location,@checkin,@checkout)
		@hotel_result = @search_service_obj.searchHotel
		@res = Kaminari.paginate_array(@hotel_result).page(params[:page]).per(1)
	end

    def show 
       hotel_id = params[:id]
       @searchObj=SearchService.new(params[:name_or_location],params[:checkin],params[:checkout])
       @room_result=@searchObj.searchRooms(hotel_id)
       @room_res=Kaminari.paginate_array(@room_result).page(params[:page])
    end

    def search_list
	    @searchObj =SearchService.new(params[:name_or_location],params[:checkin],params[:checkout])
	    if @searchObj.check_room_select
	      flash[:alert] = "Please Select Rooms For Booking"
	      redirect_to request.referer
	    else
	      redirect_to booking_index_path(room_select: params[:room_select].permit!)
	    end            
  end
end

