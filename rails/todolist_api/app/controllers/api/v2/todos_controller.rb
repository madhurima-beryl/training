class Api::V2::TodosController < ApplicationController
    include ActiveModel::Serialization
    before_action :create => :generate_signature_image

	
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
    params.require(:todo).permit(:title, :created_by, {signature: []})
  end


  def generate_signature_image
    unless self.signature.nil?
      instructions = JSON.load(self.signature).map { |h| "line #{h['mx']},#{h['my']} #{h['lx']},#{h['ly']}" } * ' '
      path_signature_image="tmp/signature_image"+DateTime.now.to_s+".png"
      system "convert -size 400x80 xc:transparent -stroke black -draw '#{instructions}' #{path_signature_image}"
      self.signature_image = File.open(path_signature_image)
    end
  end

end
