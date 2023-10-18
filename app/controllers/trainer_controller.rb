class TrainerController < ApplicationController

      def index
        @trainers = Trainer.all
        render json: @trainers
      end
    
      def create
        @trainer = Trainer.new(task_params)
        if @trainer.save
          render json: @trainer, status: :created
        else
          render json: @trainer.errors, status: :unprocessable_entity
        end
      end
    
      def update
        @trainer = Trainer.find(params[:id])
        if @trainer.update(task_params)
          render json: @trainer
        else
          render json: @trainer.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @trainer = Trainer.find(params[:id])
        @trainer.destroy
        head :no_content
      end
    
      private
    
      def task_params
        params.permit(:username, :email, :password)
      end

end
