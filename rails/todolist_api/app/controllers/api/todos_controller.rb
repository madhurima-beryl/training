class Api::TodosController < ApplicationController
	
  # GET /todos
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  # def new
  #   @todo = Todo.new
  # end

  # def edit
  #   @todo = Todo.find(params[:id])
  # end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo
    else
      render "index"
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to @todo
    else
      render "index"
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
 
    redirect_to patients_path
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :created_by)
  end
end
