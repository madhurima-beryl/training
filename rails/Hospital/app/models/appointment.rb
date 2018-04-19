class Appointment < ApplicationRecord
  belongs_to :doctors
  belongs_to :patients
  
  validates :date, :time, presence: true
end
