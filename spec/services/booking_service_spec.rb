require 'rails-helper'

RSpec.describe BookingService do
	context 'when the user is logged in,' do
		context ' display the selected room details' do
			context 'change room booking' do
				it 'displays to the hotel details page'
			end
			context 'select a valid payment mode' do
				conext 'when payment mode is valid' do
					it 'should send a booking confirmation mail'
				end
				context 'when payment mode is invalid' do
					it 'should notify the user'
				end
			end
		end
	end

	context 'when the user is not logged in' do
		it 'should notify the user to log in first'
	end
end