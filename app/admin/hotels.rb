ActiveAdmin.register Hotel do
	permit_params :hotel_name, :hotel_location, :hotel_rating,:images_attributes

	filter :hotel_name
	filter :hotel_location
	filter :hotel_rating
	filter :hotel_description

	form do |f|
		f.inputs do
			f.input :hotel_name
			f.input :hotel_location
			f.input :hotel_rating
			f.input :hotel_description
			f.has_many :images do |img|
				img.inputs "IMAGES" do
					img.input :image,as: :file,multiple: true, :hint => img.object.image.present? ? image_tag(img.object.image.url(),:width => "100",:height => "100"): content_tag(:span, "no image added")
				end
			end
			f.actions
		end
	end
	###FORM closed

	controller do
		def new
			@hotel = Hotel.new
		end  ## new end

		def create 
			@hotel = Hotel.create(hotel_params)
			if @hotel.update_attributes(hotelImg_params)
				redirect_to [:admin,@hotel]
			else
				render 'new'
			end
		end  ## new create

		def update
	      @hotel = Hotel.find(params[:id])  
	         
	      if @hotel.update_attributes(hotelImg_params)
	        redirect_to [:admin, @hotel]
	      else
	        render 'edit'
	      end
	    end   ## new update

	    def my_api
	      @hotel = Hotel.find(params[:id])  
	      render json: {reset:true}   
	      # if @hotel.update_attributes(hotelImg_params)
	      #   redirect_to [:admin, @hotel]
	      # else
	      #   render 'edit'
	      # end
	    end   ## new update

	     private
  
		def hotel_params
		   params.require(:hotel).permit(:hotel_name, :hotel_location, :hotel_rating, :hotel_description)
		end

	    def hotelImg_params
	        params.require(:hotel).permit(:hotel_name, :hotel_location, :hotel_rating, :hotel_description,images_attributes: [:id, :image, :image_cache, :_destroy])
	    end
	end
end
