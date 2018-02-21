require 'rails_helper'

RSpec.describe Hotel, type: :model do

  subject{described_class.reflect_on_association(ascc_name)}
  subject { described_class.new(hotel_name: 'orchid',hotel_location: 'pune',hotel_description: 'free wifi', hotel_rating: 4) }
  context "Associations" do
    it "has many rooms" do
      assc = described_class.reflect_on_association(:rooms)
      expect(assc.macro).to eq :has_many
    end

    it "has many images" do
      assc = described_class.reflect_on_association(:images)
      expect(assc.macro).to eq :has_many
    end
  end

  context 'Validation' do

    it "is valid with all valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a Hotel name" do
      subject.hotel_name = nil
      subject.save      
      expect(subject.errors.messages[:hotel_name][0]).to eql("can't be blank")
    end

    it "is not valid when hotel name contain digits" do
      subject.hotel_name = 234
      subject.save      
      expect(subject.errors.messages[:hotel_name][0]).to eql("only allows letters")
    end

    it "is not valid when hotel name contain special character" do
      subject.hotel_name = '*%'
      subject.save      
      expect(subject.errors.messages[:hotel_name][0]).to eql("only allows letters")
    end

    it "is not valid when hotel location is empty" do
      subject.hotel_location = nil
      subject.save
      expect(subject.errors.messages[:hotel_location][0]).to eql("can't be blank")
    end

    it "is not valid without hotel rating" do
      subject.hotel_rating = nil
      subject.save      
      expect(subject.errors.messages[:hotel_rating][0]).to eql("can't be blank")
    end

    it "is not valid if hotel rating is less than 0" do
      subject.hotel_rating = 0.1
      subject.save      
      expect(subject.errors.messages[:hotel_rating][0]).to eql("must lie in between 0 to 5")
    end

    it "is not valid if hotel rating  is greater than 5" do
      subject.hotel_rating = 6
      subject.save      
      expect(subject.errors.messages[:hotel_rating][0]).to eql("must lie in between 0 to 5")
    end

	it "is not valid if hotel description is more than 20 characters" do 
	  subject.hotel_description = 'aaaaaaaaaaaaaaaaaaaaa'
      subject.save      
      expect(subject.errors.messages[:hotel_description][0]).to eql("maximum 20 characters allowed")
   
	end     
     
  end
end

