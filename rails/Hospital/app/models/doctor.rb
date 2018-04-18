class Doctor < ApplicationRecord
	validates :name, :ph_no, :salary, presence: true 
end
