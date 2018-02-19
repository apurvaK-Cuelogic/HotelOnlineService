class Hotel < ApplicationRecord
	has_many :rooms, dependent: :destroy
	has_many :images, as: :imageable, dependent: :destroy
	validates :name,:hotel_name, :hotel_location, presence: true
	
	def name
		hotel_name
	end

	validates :hotel_name,:hotel_location, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :hotel_description, length: { maximum: 100 }
    validates :hotel_rating , :inclusion => {:in => 0..5, message:"must lie in between 0 to 5"},numericality: { only_integer: true }


     accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes[:image].nil? }

    scope :name_location, -> (name){ where("(hotel_name ILIKE ? OR hotel_location ILIKE ?)", "#{name}%", "#{name}%")} 
  	scope :room_inactive, -> { joins(:rooms).where(rooms: { inactive_date: nil} )}
  	scope :room_id_not, ->  (query){ where.not( "rooms.id": query ) }
	scope :id, ->(id){ where("id": id)}	

	scope :hotelsearchResult,->(booking_rooms,name_or_location){ joins(:rooms).where.not(:rooms => {id: booking_rooms} ).where("hotel_name ILIKE ? OR hotel_location ILIKE ?","#{name_or_location}%","#{name_or_location}%").uniq}
end

