class Specialization < ApplicationRecord
	has_many :doctors, inverse_of: :specialization
	validates :name, presence: true
end
