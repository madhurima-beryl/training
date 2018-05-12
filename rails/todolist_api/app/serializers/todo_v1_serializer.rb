# module V1
  class TodoV1Serializer < ActiveModel::Serializer
    attributes :id, :title, :created_by
    has_many :items

    def title
       "I have to do the task #{object.title}"   
    end
  end
# end

# require 'jsonapi-serializers'
# class TodoSerializer
#   include JSONAPI::Serializer

#   def attributes
#     data = super
#     data[:title] = object.title
#     data[:created_by] = object.created_by
#     data
#   end
#   # attributes :id, :title, :created_by

#   def self_link
#     return nil    
#   end

# end
