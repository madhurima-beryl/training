class Doctor < ApplicationRecord
  belongs_to :specialization
  has_many :appointments
  has_many :patients, through: :appointments
  
  validates :name, :ph_no, :salary, presence: true
  validates :specialization, presence: true
end
