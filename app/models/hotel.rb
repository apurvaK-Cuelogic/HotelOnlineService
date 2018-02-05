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

end

