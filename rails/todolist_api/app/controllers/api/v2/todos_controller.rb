class Api::V2::TodosController < ApplicationController
    include ActiveModel::Serialization
	
  # GET api/todos
  def index
    @todos = Todo.all
    render json: @todos, each_serializer: TodoV2Serializer
  end

  # GET api/todos/:id
  def show
    @todo = Todo.find(params[:id])
    render json: @todo, serializer: TodoV2Serializer  
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

  #  PATCH/PUT api/todos/:id
  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      render json: @todo, adapter: :json, status: 200
    else
      render json: { error: @todo.errors }, status: 400#422
    end
  end

  # DELETE api/todos/:id
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    head 204
  end

  private
  def todo_params
    # params.permit(:title, :created_by)
    params.require(:todo).permit(:title, :created_by)
  end
end
