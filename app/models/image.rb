  class Image < ApplicationRecord
	before_validation :assign_imageable
	mount_uploader :image,ImageUploader
	belongs_to :imageable,polymorphic: true


	before_save :update_image_attributes
	 

  alias_attribute :filename, :original_filename


	def imageable_hotel
   	 self.imageable.id if self.imageable.is_a? Hotel
 	end

  def imageable_room
    self.imageable.id if self.imageable.is_a? Room
  end

  protected
  def assign_imageable
    if !@imageable_hotel.blank? && !@imageable_room.blank?
	  errors.add(:imageable, "can't have both a hotel and a room") 
    else
      unless @imageable_hotel.blank?
        self.imageable = Hotel.find(@imageable_hotel)
      end
 
      unless @imageable_room.blank?
        self.imageable = Room.find(@imageable_room)
      end
    end
  end
##
private
  
  def update_image_attributes
    if image.present? && image_changed?
     #self.original_filename = image.file.original_filename
     # self.content_type = image.file.content_type
    end
  end
end