class SearchController < ApplicationController
	layout false
	def searchView
		@name_or_location = params[:name_or_location]
		@checkin = params[:checkin]
		@checkout = params[:checkout]

		Rails.cache.write("checkin",@checkin)
		Rails.cache.write("checkout",@checkout)
		@search_service_obj = SearchService.new(@name_or_location,@checkin,@checkout)
		@hotel_result = @search_service_obj.searchHotel
		@res = Kaminari.paginate_array(@hotel_result).page(params[:page]).per(3)
	end

    def show 
       hotel_id = params[:id]
       @searchObj=SearchService.new(params[:name_or_location],params[:checkin],params[:checkout])
       @room_result=@searchObj.searchRooms(hotel_id)
       @room_res=Kaminari.paginate_array(@room_result).page(params[:page])
    end

end

