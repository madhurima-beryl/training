class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
        :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  # validates_acceptance_of :t_o_c, :allow_nil => false, :accept => true, :on => :create


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
