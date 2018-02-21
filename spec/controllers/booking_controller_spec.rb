require 'rails_helper'

RSpec.describe BookingController, type: :controller do

  describe "GET #confirmBooking" do
    it "returns http success" do
      get :confirmBooking
      expect(response).to have_http_status(:success)
    end
  end

end
