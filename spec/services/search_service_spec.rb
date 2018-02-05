require 'rails_helper'

RSpec.describe SearchService do

	context "#by_location " do
       context "when location is present" do
       		context "and rooms are available for specified dates"
       			it "returns list of hotels"

       		context "and rooms are not available for specified dates"
       			it "returns nil"

       end
		context "when location is not present" do
       		it "returns nil"
       end
	end

	context "#by_hotelName " do
       context "when hotelName is present" do
       		context "and rooms are available for specified dates"
       			it "display the hotel details"

       		context "and rooms are not available for specified dates"
       			it "returns nil"

       end
		context "when hotelName is not present" do
       		it "returns nil"
       end
	end

	context "#by_roomPrice"
		context "when the rooms are available in given range" do
			it "returns list of rooms"
		end
		context "when the rooms are not available in given range" do
			it "returns nil"
		end
	end

	context "#by_roomRating"
		context "when the rooms are available in given range" do
			it "returns list of rooms"
		end
		context "when the rooms are not available in given range" do
			it "returns nil"
		end
	end


end  #SearchService end
