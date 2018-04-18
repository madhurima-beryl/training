class Appointment < ApplicationRecord
	validates :date, :time, presence: true
	belongs_to :doctors
	belongs_to :patients
end
