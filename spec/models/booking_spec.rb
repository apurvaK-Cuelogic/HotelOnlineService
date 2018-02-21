require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject(:member) { Member.create(firstname:"apurva",lastname:"kirti",email:"example@gmail.com",mobile_no:"9999999999",password:"123456") }  
  subject(:booking) { described_class.new(bookingDate: '2018-02-10',checkinDate: '2018-02-19',checkoutDate: '2018-02-20', member_id: 1) }
  context "Associations" do
    it "has many rooms" do
      assc = described_class.reflect_on_association(:rooms)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end

    it "belongs to members" do
      assc = described_class.reflect_on_association(:member)
      expect(assc.macro).to eq :belongs_to
    end
  end

  context 'Validation' do

    it "is not valid without a Booking date" do
      booking.bookingDate = nil
      booking.save
      expect(booking.errors.messages[:bookingDate][0]).to eql("can't be blank")
    end

    it "is not valid without a Checkin date" do
      booking.checkinDate = nil
      booking.save
      expect(booking.errors.messages[:checkinDate][0]).to eql("can't be blank")
    end

    it "is not valid without a Checkout date" do
      booking.checkoutDate = nil
      booking.save
      expect(booking.errors.messages[:checkoutDate][0]).to eql("can't be blank")
    end

    it "is not valid if member id does not exist" do
      booking.member_id = member.id
	  booking.save
      expect(booking).to be_valid
    end

  end
end
