class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  email_regex= /\A[a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9]+(\.[a-z0-9]+)*(\.[a-z]{2,3})\z/ 
  mobile_regex=/\A[0-9]{10}\z/
  validates :firstname,:lastname,:presence => true,format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 3..20}
  validates :email,:uniqueness => true, format:{ with: email_regex}
  validates :mobile_no, :presence => true,:format => {with:mobile_regex}
 
end