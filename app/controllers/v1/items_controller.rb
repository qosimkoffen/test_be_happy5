module V1
  class ItemsController < ApplicationController
      before_action :set_todo
      before_action :set_todo_item, only: [:show, :update, :destroy]
    
      # GET /todos/:todo_id/items
      def index
        json_response(@todo.items)
      end
    
      # GET /todos/:todo_id/items/:id
      def show
        json_response(@item)
      end
    
      # POST /todos/:todo_id/items
      def create
        @create_item = @todo.items.create!(item_params) # buat variabel baru, biar items nya ngikutin id todos
        json_response(@create_item, :created)
      end
    
      # PUT /todos/:todo_id/items/:id
      def update
        @item.update(item_params)
        json_response({message: 'Update berhasil',data: @item})
      end
    
      # DELETE /todos/:todo_id/items/:id
      def destroy
        @item.destroy
        json_response({message: 'BERHASIL Delete',data: @item})
      end
    
      private
    
      def item_params
        params.permit(:name, :done, :todo_id)
      end
    
      def set_todo
        @todo = Todo.find(params[:todo_id])
      end
    
      def set_todo_item
        @item = @todo.items.find_by!(id: params[:id]) if @todo
      end
  end
end