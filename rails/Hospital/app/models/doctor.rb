class Doctor < ApplicationRecord
  belongs_to :specialization
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  
  validates :name, :ph_no, :salary, presence: true
  validates :specialization, presence: true
  validates :name, length:{ minimum: 2 }
  validates :ph_no, uniqueness: true

  def self.search(search)
    # debugger
    if search
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      where('name LIKE ?', "%#{search}%")
    else
      # default_scope { where('name LIKE ?', "%#{search}%") }
      # scope :id, -> { where("id = ?", params[:id]) }
      # scope :salary, -> { where("salary = ?", params[:salary]) }
      # scope :specialization_id, -> { where("specialization_id = ?", params[:specialization_id]) }
      # scope :name
      where(nil)
    end
  end

end
