class Appointment < ApplicationRecord
		validates :date, :time, presence: true
end
