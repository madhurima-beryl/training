class Doctor < ApplicationRecord
  belongs_to :specialization
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  
  validates :name, :ph_no, :salary, presence: true
  validates :specialization, presence: true
  validates :name, length:{ minimum: 2 }
  validates :ph_no, uniqueness: true
end
