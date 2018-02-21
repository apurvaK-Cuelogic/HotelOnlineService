require 'rails_helper'

RSpec.describe Member, type: :model do

	subject { described_class.new(firstname:"apurva",lastname:"kirti",email:"example@gmail.com",mobile_no:"9999999999",password:"123456")}		

	context 'Validation' do
  	name_regex=/\A[a-z][a-zA-Z]+\z/

    it "is valid with all valid attributes" do
      subject.save
      expect(subject).to be_valid
    end
     
	  it "is not valid without a firstname" do
      subject.firstname = nil
      subject.save      
      expect(subject.errors.messages[:firstname][0]).to eql("can't be blank")
    end

    it "is not valid when firstname is small than 3characters" do
      subject.firstname = 't'
      subject.save      
      expect(subject.errors.messages[:firstname][0]).to eql("is too short (minimum is 3 characters)")
    end

    it "is not valid when firstname contains more than 20characters" do
      subject.firstname = 'asdfghjklpoiuytrewqazxcvbnm'
      subject.save      
      expect(subject.errors.messages[:firstname][0]).to eql("is too long (maximum is 20 characters)")
    end

    it "is not valid when firstname contains digits" do
      subject.firstname = 123
      subject.save
      expect(subject.errors.messages[:firstname][0]).to eql("only allows letters")
    end

    it "is not valid without a lastname" do
      subject.lastname = nil
      subject.save
      expect(subject.errors.messages[:lastname][0]).to eql("can't be blank")
    end

    it "is not valid when lastname is small than 3characters" do
      subject.lastname = 't'
      subject.save      
      expect(subject.errors.messages[:lastname][0]).to eql("is too short (minimum is 3 characters)")
    end

    it "is not valid when lastname contains more than 20characters" do
      subject.lastname = 'asdfghjklpoiuytrewqazxcvbnm'
      subject.save      
      expect(subject.errors.messages[:lastname][0]).to eql("is too long (maximum is 20 characters)")
    end

    it "is not valid when lastname contains digits" do
      subject.lastname = 123
      subject.save
      expect(subject.errors.messages[:lastname][0]).to eql("only allows letters")
  	end

    it "is not valid without an email" do
      subject.email = nil
      subject.save
      expect(subject.errors.messages[:email][0]).to eql("can't be blank")
    end

    it "is not valid when the email does not contain a domain name" do
      subject.email = 'example'
      subject.save
      expect(subject.errors.messages[:email][0]).to eql("is invalid")
    end

    it "is valid with an proper email input" do
      subject.email = "example@gmail.com"
      subject.save
      expect(subject.errors.messages[:email][0]).to eql(nil)
    end

    it "is not valid without a mobile" do
      subject.mobile_no = nil
      subject.save
      expect(subject.errors.messages[:mobile_no][0]).to eql("can't be blank")
    end

    it "is not valid when mobile number is less than 10 digits" do
      subject.mobile_no = 999
      subject.save
      expect(subject.errors.messages[:mobile_no][0]).to eql("is invalid")
    end

    it "is valid with a proper mobile number input" do
      subject.mobile_no = 9999999999
      subject.save
      expect(subject.errors.messages[:mobile_no][0]).to eql(nil)
    end

    it "is not valid without a password" do
      subject.password = nil
      subject.save
      expect(subject.errors.messages[:password][0]).to eql("can't be blank")
    end
    

  end
end
