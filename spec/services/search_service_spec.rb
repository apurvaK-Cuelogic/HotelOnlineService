require 'rails_helper'

RSpec.describe SearchService, type: :services do 
  describe 'by name_or_location' do
    context 'when records are present' do
      context 'and when room is available on the given check-in check-out date' do
        it ' returns hotel list' do        
        end
      end
      context 'and when room is not available on the given check-in check-out date' do
        it 'displays no hotels found' do
        end
      end  	    
  	end
  	context 'when records are not present' do
      it 'displays no hotels found' do
      end  		
  	end
  end

end