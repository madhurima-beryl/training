class TodoV2Serializer < ActiveModel::Serializer
    attributes :id, :title, :created_by, :taskfile
    has_many :items, serializer: ItemV2Serializer

    def title
       "I have to do the task #{object.title}"   
    end

    # def items
    #   {
    #     name: object ,
    #     # given_by: object.todo.created_by,
    #     # sign: object.todo.signature

    #   }
    # end
  end