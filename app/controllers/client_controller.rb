class ClientController < ApplicationController

      def index
        @clients = Client.all
        render json: @clients
      end
    
      def create
        @client = Client.new(task_params)
        if @client.save
          render json: @client, status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end
    
      def update
        @client = Client.find(params[:id])
        if @client.update(task_params)
          render json: @client
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @client = Client.find(params[:id])
        @client.destroy
        head :no_content
      end
    
      private
    
      def task_params
        params.permit(:username, :email, :password)
      end

end
