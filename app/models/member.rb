class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  email_regex= /\A[a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9]+(\.[a-z0-9]+)*(\.[a-z]{2,3})\z/
  password_regex= /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}\z/ 
  mobile_regex=/\A[0-9]{10}\z/
  validates :firstname,:lastname,format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 3..20, message:"max length is 20 characters"}
  validates :email,:uniqueness => true, format:{ with: email_regex}
  validates :mobileNumber, :presence => true,:format => {with:mobile_regex,message:"must contain 10 digits"}
  validates :password, confirmation: true, format:{with: password_regex}
  validates :password_confirmation, presence: true
end