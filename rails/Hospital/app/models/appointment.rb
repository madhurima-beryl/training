class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  
  validates :patient, :doctor, :date, :time, presence: true
end

