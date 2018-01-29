ActiveAdmin.register Room do
	permit_params :room_price, :room_rating, :no_of_bedrooms, :hotel_id

end
