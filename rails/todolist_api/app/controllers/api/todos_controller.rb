class Api::TodosController < ApplicationController
	
  # GET api/todos
  def index
    @todos = Todo.all
    render json: @todos, each_serializer: TodoSerializer
  end

  # GET api/todos/:id
  def show
    @todo = Todo.find(params[:id])
    render json: @todo, serializer: TodoSerializer  
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, adapter: :json, status: 201
    else
      render json: { error: @todo.errors }, status: 400#422
    end
    # if @todo.save
    #   @todo = JSONAPI::Serializer.serialize(@todo,{serializer: TodoSerializer})
    #   render json: { todo: @todo,status: 200}
    # else
    #   # render "index"
    #   render json: {message: "Please provide correct info",status: 400}
    # end
  end

  # PUT /todos/:id
  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to @todo
    else
      render "index"
    end
  end

  # DELETE /todos/:id
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
 
    redirect_to todos_path
  end

  private
  def todo_params
    # params.permit(:title, :created_by)
    params.require(:todo).permit(:title, :created_by)
  end
end
