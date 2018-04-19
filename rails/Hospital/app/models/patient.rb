class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  
  validates :name, :d_o_b, :gender, :ph_no, presence: true
end
