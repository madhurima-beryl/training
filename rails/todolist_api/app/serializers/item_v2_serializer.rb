class ItemV2Serializer < ActiveModel::Serializer
    attributes :id, :name, :done
    belongs_to :todo#, serializer: TodoSerializer, exclude: :id

    def todo
      # object.todo.where(created_by: scope)
      {
        title: object.todo.title ,
        given_by: object.todo.created_by,
        sign: object.todo.signature

      }
    end
  end