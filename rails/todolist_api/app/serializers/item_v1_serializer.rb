# module V1
  class ItemV1Serializer < ActiveModel::Serializer
    attributes :id, :name, :done
    belongs_to :todo#, serializer: TodoSerializer, exclude: :id

    def todo
      # object.todo.where(created_by: scope)
      {
        title: object.todo.title ,
        assigned_by: object.todo.created_by
      }
    end
  end
# end

# def todo
   
#   	@todo.title = "#{object.todo.title}"
#   	@todo.created_by = "#{object.todo.created_by}"   
#   end
