class TodoV2Serializer < ActiveModel::Serializer
    attributes :id, :title, :created_by, :signature
    has_many :items

    def title
       "I have to do the task #{object.title}"   
    end
  end