class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  # attr_accessible :image, :remote_image_url
  mount_uploader :image, ImageUploader

  # User Image Validation
  validates_integrity_of  :image
  validates_processing_of :image

  # private
  #   def avatar_size_validation
  #     errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  #   end
end
