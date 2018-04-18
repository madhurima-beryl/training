class Patient < ApplicationRecord
	validates :name, :d_o_b, :gender, :ph_no, presence: true 
end
