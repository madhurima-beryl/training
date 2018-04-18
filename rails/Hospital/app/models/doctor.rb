class Doctor < ApplicationRecord
	validates :name, :ph_no, :salary, presence: true
	belongs_to :specilization
	validates :specilization, presence: true
	has_many :appointments
	has_many :patients, through: :appointments
end
