class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    json_response({message: 'Update berhasil',data: @todo})
    # @todo.update(todo_params)
    # head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    json_response({message: 'BERHASIL Delete',data: @todo})
  end

  private

  def todo_params
    # whitelist params
    # params.permit(:title, :created_by, :, :todo)
    params.require(:todo).permit(:title, :created_by, :id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end