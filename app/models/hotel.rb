class Hotel < ApplicationRecord
	has_many :rooms
	validates :name,:hotel_name, :hotel_location, presence: true
	
	def name
		hotel_name
	end

	validates :hotel_name,:hotel_location, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :hotel_description, length: { maximum: 100 }
    validates :hotel_rating , :inclusion => {:in => 0..5, message:"must lie in between 0 to 5"},numericality: { only_integer: true }

end
