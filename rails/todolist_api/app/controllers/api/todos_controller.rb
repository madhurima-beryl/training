class Api::TodosController < ApplicationController
	
  # GET api/todos
  def index
    @todos = Todo.all
    render json: @todos
  end

  # GET api/todos/:id
  def show
    render json: @todo    
    # @todo = Todo.find(params[:id])
  end

  # def new
  #   @todo = Todo.new
  # end

  # def edit
  #   @todo = Todo.find(params[:id])
  # end

  # POST /todos
  def create
    # debugger
    @todo = Todo.new(todo_params)
    if @todo.save
      # 
      @todo = JSONAPI::Serializer.serialize(@todo,{serializer: TodoSerializer})
      # debugger
      render json: { todo: @todo,status: 200}
      # redirect_to @todo
    else
      # render "index"
      render json: {message: "Please provide correct info",status: 400}
    end
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
