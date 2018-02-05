require 'rails_helper'

RSpec.describe Member, type: :model do

	subject { described_class.new(firstname:"apurva",lastname:"kirti",email:"example@gmail.com",mobile_no:"9999999999",password:"qwer@#123")}		

	  	it "is valid with valid attributes" do
    		expect(subject).to be_valid
  		end

  		it "is not valid without a firstname" do
	      	subject.firstname = nil
	      	expect(subject.errors.messages[:firstname][0]).to eql("can't be blank")
	    end

		it "is not valid without lastname" do
			subject.lastname = nil
			expect(subject.errors.messages[:firstname][0]).to eql("can't be blank")
			expect(subject).to_not be_valid
		end

		it "is not valid without a email id" do
			subject.email = nil
			expect(subject.errors.messages[:firstname][0]).to eql("can't be blank")
			expect(subject).to_not be_valid
		end

		it "is not valid without a mobile number" do
			subject.mobile_no = nil
			expect(subject.errors.messages[:firstname][0]).to eql("can't be blank")
			expect(subject).to_not be_valid
		end

		it "is not valid without a password" do
			subject.password = nil
			expect(subject.errors.messages[:firstname][0]).to eql("can't be blank")
			expect(subject).to_not be_valid
		end

end
