class Appointment < ApplicationRecord
  belongs_to :doctors
  belongs_to :patients
  
  validates :patients_id, :doctors_id, :date, :time, presence: true
end
