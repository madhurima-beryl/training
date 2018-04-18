class Patient < ApplicationRecord
	validates :name, :d_o_b, :gender, :ph_no, presence: true
	has_many :appointments
	has_many :doctors, through: :appointments
end
