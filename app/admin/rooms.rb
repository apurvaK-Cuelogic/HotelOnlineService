ActiveAdmin.register Room do
	permit_params :room_price, :room_rating, :no_of_bedrooms,:inactive_date, :hotel_id,:images_attributes

	form do |f|
    f.inputs do
    if f.object.new_record?
      f.input :hotel_id, as: :select, multiple: false, collection: Hotel.all
	  end  #if end
      f.input :room_price
      f.input :room_rating, as: :number, min: 0,max: 5
      f.input :room_description
      f.input :no_of_bedrooms, as: :select, multiple: false, collection: ['1','2','3']
      f.input :inactive_date
      f.has_many :images do |img|
        img.inputs "IMAGES" do
          img.input :image,as: :file,multiple: true, :hint => img.object.image.present? ? image_tag(img.object.image.url(),:width => "100",:height => "100"): content_tag(:span, "no image added")
        end
      end
    f.actions
  end
  end

  controller do
    def new
      @room = Room.new
    end  ## new end

    def create 
      @room = Room.create(room_params)
      if @room.update_attributes(roomImg_params)
        redirect_to [:admin,@room]
      else
        render 'new'
      end
    end  
    def update
        @room = Room.find(params[:id])  
           
        if @room.update_attributes(roomImg_params)
          redirect_to [:admin, @room]
        else
          render 'edit'
        end
      end  

       private
  
    def room_params
       params.require(:room).permit(:room_price, :room_rating, :room_description, :no_of_bedrooms, :inactive_date, :hotel_id)
    end


      def roomImg_params
          params.require(:room).permit(:room_price, :room_rating, :room_description, :no_of_bedrooms, :inactive_date, :hotel_id, images_attributes: [:id, :image, :image_cache, :_destroy])
      end
  end
end
