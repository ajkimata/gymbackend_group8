class TrainerPerformanceController < ApplicationController

    def index
        @performances = TrainerPerformance.all
        render json: @performances
    end

    def create
        @performance = TrainerPerformance.new(task_params)
        if @performance.save
            render json: @performance, status: :created
        else
            render json: @performance.errors, status: :unprocessable_entity
        end
    end

    def update
        @performance = TrainerPerformance.find(params[:id])
        if @performance.update(task_params)
            render json: @performance
        else
            render json: @performance.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @performance = TrainerPerformance.find(params[:id])
        @performance.destroy
        head :no_content
    end

    private

    def task_params
        params.permit(:trainer_id, :trainer_remarks)
    end

end
