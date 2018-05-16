class Todo < ApplicationRecord

  # association
  has_many :items, dependent: :destroy

  # validations
  validates_presence_of :title, :created_by

  # signature uploader
  mount_uploader :taskfile, TaskfileUploader

end
